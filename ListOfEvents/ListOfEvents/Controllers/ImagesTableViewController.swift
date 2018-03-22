//
//  ImagesTableViewController.swift
//  ListOfEvents
//
//  Created by Admin on 23/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//

import UIKit
import SDWebImage

class ImagesTableViewController: UITableViewController {

    var selectedEvent:Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let e = self.selectedEvent{
            self.title = e.title
        }
        //remove lines from bottom
        self.tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedEvent!.images?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImagesTableViewCell
        cell.eventImage.sd_setImage(with: URL(string:self.selectedEvent!.images![indexPath.row].imageUrl!), placeholderImage: #imageLiteral(resourceName: "download (7)"), options: .progressiveDownload, completed: nil)
        return cell
    }

}
