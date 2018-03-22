//
//  ViewController.swift
//  ListOfEvents
//
//  Created by Admin on 22/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//

import UIKit
import RxSwift


class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rxObservers()
    }
    
}

extension ViewController{
    func rxObservers(){
        EventsViewModel.shared.getEevents(pageSize: 20, pagNo: 1, cityId: "88da18ae-dccd-4a8a-83d4-6c6afd5bc346")
            .subscribe { (e) in
                print(e.element)
            }.disposed(by:self.disposeBag)
    }
}
