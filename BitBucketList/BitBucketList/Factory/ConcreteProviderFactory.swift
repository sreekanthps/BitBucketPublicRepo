//
//  ConcreteProviderFactory.swift
//  BitBucketList
//
//  Created by Sreekanth on 02/09/21.
//

import Foundation
import Moya

protocol ProvderFactory {
    var contactDataProvder: MoyaProvider<RepoListDataTarget> { get }
}
struct ConcreteProviderFactory: ProvderFactory {
    private static var instance = ConcreteProviderFactory()
    public static var shared : ConcreteProviderFactory {
        return instance
    }
    var contactDataProvder: MoyaProvider<RepoListDataTarget> = MoyaProvider<RepoListDataTarget>()
}
