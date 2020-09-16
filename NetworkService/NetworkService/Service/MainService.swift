//
//  MainService.swift
//  NetworkService
//
//  Created by satrio.wicaksono on 17/09/20.
//  Copyright © 2020 Playground. All rights reserved.
//

import Foundation
import Moya

public enum MainService {
    case main
}

extension MainService: TargetType {
    
    public var headers: [String : String]? {
        return [:]
    }
    
    public var baseURL: URL {
        return URL(string: "https://")!
    }

    public var path: String {
        switch self {
        case .main:
            return "main"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .main:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .main:
            return .requestPlain
        }
    }
}
