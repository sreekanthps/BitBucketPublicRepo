//
//  RepoListDataTarget.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import Moya

public enum RepoListDataTarget {
    case getRepoList
    case getNetRepoList(parameter: String)
}

extension RepoListDataTarget: TargetType {
    public var headers: [String : String]? {
        nil
    }
    
    public var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }
    
    public var path: String {
            return ""
    }
    
    public var method: Method {
            return .get
        
    }
    
    public var sampleData: Data {
        Data()
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
            return .requestPlain
       
    }
}
