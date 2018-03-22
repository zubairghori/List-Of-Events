//
//  Event.swift
//  ListOfEvents
//
//  Created by Admin on 22/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//

import UIKit

class Event: Decodable {
    var title:String?
    var id:String?
    var reviewsCount:Int?
    var reviewsAverageRate:String?
    var images:[EventImage]?
    var chef:Chef?
    var city:City?
    var schedules:[Schedule]?
}
