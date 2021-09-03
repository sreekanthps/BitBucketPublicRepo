//
//  BitbucketList.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import Foundation
public struct BitbucketList : Codable {
    let pagelen : Int?
    var values : [Values]?
    var next : String?
}
public struct Values : Codable {
    let uuid : String?
    let forkPolicy : String?
    let fullName : String?
    let name : String?
    let project : Project?
    let language : String?
    let createdOn : String?
    let mainbranch : Mainbranch?
    let owner : Owner?
    let updatedOn : String?
    let size : Int?
    let type : String?
    let slug : String?
    let isPrivate : Bool?
    let description : String?
    let links : Links?
}

public struct Project : Codable {
    let type : String?
    let name : String?
    let key : String?
    let uuid : String?
    let links : Links?

}
public struct Owner : Codable {
    let displayName : String?
    let uuid : String?
    let links : Links?
    let type : String?
    let nickname : String?
    let account_id : String?
}

public struct Links : Codable {
   
    let avatar : Avatar?
    let selfLink: SelfLink?
    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case avatar = "avatar"
    }
}
public struct Avatar : Codable {
    let href : String?
}
struct SelfLink : Codable {
    let href : String?
}
struct Mainbranch : Codable {
    let type : String?
    let name : String?

}

