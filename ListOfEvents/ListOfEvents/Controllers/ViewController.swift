//
//  ViewController.swift
//  ListOfEvents
//
//  Created by Admin on 22/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage
import  SwiftMoment

class ViewController: UIViewController {
    
    @IBOutlet weak var eventTable: UITableView!
    let disposeBag = DisposeBag()
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rxObservers()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ImagesTableViewController
        dest.selectedEvent = sender as! Event
    }
}

extension ViewController{
    func rxObservers(){
        EventsViewModel.shared.getEevents(pageSize: 20, pagNo: 1, cityId: "88da18ae-dccd-4a8a-83d4-6c6afd5bc346")
            .map({ (eve) -> [Event] in
                return eve.sorted(by: {$0.schedules!.first!.eventStart!.date > $1.schedules!.first!.eventStart!.date})
            })
            .bind(to: self.eventTable.rx.items(cellIdentifier: "eventCell", cellType: EventsTableViewCell.self)){ (index, event, cell) in
                cell.title.text = event.title
                cell.reviewCount.text = "\(event.reviewsCount!)"
                cell.averageReview.text = event.reviewsAverageRate
                cell.price.text = event.schedules?.first?.price
                cell.date.text =  event.schedules?.first?.eventStart?.eventDate
                cell.chefName.text = "\(event.chef!.firstName!) \(event.chef!.lastName!)".capitalized
                cell.chefImage.sd_setImage(with: URL(string:event.chef!.avatarUrl!), placeholderImage: nil, options: .progressiveDownload, progress: nil, completed: nil)
                self.events.append(event)
            }
            .disposed(by:self.disposeBag)
        
        self.eventTable.rx.itemSelected
            .subscribe{
                let selectedEvent = self.events[$0.element!.row]
                self.performSegue(withIdentifier: "images", sender: selectedEvent)
        }.disposed(by: self.disposeBag)
    }
}
