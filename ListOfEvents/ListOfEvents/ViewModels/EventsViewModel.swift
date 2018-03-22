//
//  EventsViewModel.swift
//  ListOfEvents
//
//  Created by Admin on 22/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//

import Moya
import RxSwift

class EventsViewModel {
    
    static let shared = EventsViewModel()
    private let providor = MoyaProvider<EService>()
    
    func getEevents(pageSize:Int,pagNo:Int,cityId:String)->Observable<[Event]>{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return providor.rx
            .request(.events(pageSize: pageSize, pageNo: pagNo, cityId: cityId))
            .map([Event].self, atKeyPath: "data.items", using:decoder , failsOnEmptyData: false)
            .asObservable()
    }
}
