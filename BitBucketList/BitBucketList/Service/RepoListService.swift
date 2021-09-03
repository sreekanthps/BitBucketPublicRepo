//
//  RepoListService.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import Foundation
import Moya

public protocol RepoListServiceProtocol {
    func getRepoList()
    func getNextRepoList(params: String)
}
// MARK: - RepoListResponseProtocol
public protocol RepoListResponseProtocol {
    func returnRepoList(list: BitbucketList?, isNew: Bool)
    
}

public struct RepoListService: RepoListServiceProtocol {
    let provider: MoyaProvider<RepoListDataTarget>
    var delegate: RepoListResponseProtocol?
    let decoder = JSONDecoder()
    init(provider: MoyaProvider<RepoListDataTarget>, delegate: RepoListResponseProtocol) {
        self.provider = provider
        self.delegate = delegate
    }
    
     public func getRepoList() {
        var bitbucketList: BitbucketList?
        self.provider.request(RepoListDataTarget.getRepoList) { result in
            switch result {
            case let .success(moyaresponse):
                do {
                    let filterResponse = try moyaresponse.filterSuccessfulStatusCodes()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    bitbucketList = try filterResponse.map(BitbucketList.self, using: decoder)
                    delegate?.returnRepoList(list: bitbucketList, isNew: false)
                }
                
                catch let error {
                    print("error \(error.localizedDescription)")
                    // Here we get either statusCode error or objectMapping error.
                    // TODO: handle the error == best. comment. ever.
                }
            case let .failure(error):
                print("Error Data")
               
                // TODO: handle the error == best. comment. ever.
            }
        }
    }
    public func getNextRepoList(params: String) {
        var bitbucketList: BitbucketList?
        self.provider.request(RepoListDataTarget.getNetRepoList(parameter: params)) { result in
            switch result {
            case let .success(moyaresponse):
                do {
                    let filterResponse = try moyaresponse.filterSuccessfulStatusCodes()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    bitbucketList = try filterResponse.map(BitbucketList.self, using: decoder)
                    delegate?.returnRepoList(list: bitbucketList, isNew: true)
                }
                
                catch let error {
                    print("error \(error.localizedDescription)")
                    // Here we get either statusCode error or objectMapping error.
                    // TODO: handle the error == best. comment. ever.
                }
            case let .failure(error):
                print("Error Data")
               
                // TODO: handle the error == best. comment. ever.
            }
        }
    }
    
    
}
