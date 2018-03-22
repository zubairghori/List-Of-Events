//
//  EServices.swift
//  ListOfEvents
//
//  Created by Admin on 22/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//

import Moya

enum EService{
    case events(pageSize:Int,pageNo:Int,cityId:String)
}

extension EService: TargetType{
    
    var baseURL: URL {
        return URL(string: "http://c2-backend-dev.eu-central-1.elasticbeanstalk.com/")!
    }

    var sampleData: Data {
        return Data()
    }
    
    var method: Method {
        switch self {
        case .events:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .events(let pageSize, let pageNo, let cityId):
            return .requestParameters(parameters: ["pageSize":pageSize,"pageNumber":pageNo,"cityId":cityId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]

    }
    
    var path: String {
        switch self {
        case .events:
            return "events"
        }
    }
}
