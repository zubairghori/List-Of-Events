//
//  Date.swift
//  ListOfEvents
//
//  Created by Admin on 23/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//


import SwiftMoment


extension Date{
    var toTimestamp:Double{
        return self.timeIntervalSince1970 * 1000
    }
    static func <(lhs:Date,rhs:Date)->Bool{
        return lhs.compare(rhs) == ComparisonResult.orderedDescending
    }
    static func >(lhs:Date,rhs:Date)->Bool{
        return lhs.compare(rhs) == ComparisonResult.orderedAscending
    }
   
}
extension Double{
    var toDate:Date{
        return Date(timeIntervalSince1970: self / 1000)
    }
}
extension String{
    var eventDate:String{
        let m = moment(self)!
        return "\(m.month)-\(m.day)-\(m.year) at \(m.hour):\(m.minute)"
    }
    var date:Date{
        return moment(self)!.date
    }
}
