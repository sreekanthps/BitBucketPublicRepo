//
//  RepoListInteractor.swift
//  BitBucketList
//
//  Created by Sreekanth on 27/7/21.
//

import Foundation

class RepoListInteractor: RepoListPresentertoInteractorProtocol {
    
    
    
    // MARK: - Properties
    var bitbucketList: BitbucketList?
    weak var presenter: RepoListInteractortoPresenterProtocol?
   
    // MARK: - Methods
    func getRepoList() {
        let service = RepoListService(provider: ConcreteProviderFactory.shared.contactDataProvder, delegate: self)
        service.getRepoList()
    }
    
    func getNextRepo(withUrl url: String) {
        let service = RepoListService(provider: ConcreteProviderFactory.shared.contactDataProvder, delegate: self)
        service.getNextRepoList(params: url)
    }
    
    
}

extension RepoListInteractor:  RepoListResponseProtocol  {
    func returnRepoList(list: BitbucketList?, isNew: Bool) {
        if isNew {
            self.presenter?.returnNextRepoList(list: list)
        } else {
            self.presenter?.returnRepoList(list: list)
        }
    }
}
