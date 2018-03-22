//
//  Schedule.swift
//  ListOfEvents
//
//  Created by Admin on 23/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//

import UIKit

class Schedule: Decodable {
    var id : Int?
    var eventStart : String?
    var eventDeadline : String?
    var servingsSold : Int?
    var servings : Int?
    var price : String?
    var currency : Currency?
}
