//
//  RepoListPresenter.swift
//  BitBucketList
//
//  Created by Sreekanth on 27/7/21.
//

import Foundation

class RepoListPresenter: RepoListViewtoPresenterProtocol {
    
    // MARK: - Properties
    var bitbucketList: BitbucketList?
    var view: RepoListPresentertoViewProtocol?
    var interactor: RepoListPresentertoInteractorProtocol?
    var router: RepoListPresentertoRouterProtocol?
    
    func getRepoInfo() {
        interactor?.getRepoList()
    }
    
    func getNextRepo(withUrl url: String) {
        interactor?.getNextRepo(withUrl: url)
    }
    
    
}
extension RepoListPresenter: RepoListInteractortoPresenterProtocol {
    func returnNextRepoList(list: BitbucketList?) {
        view?.returnNextRepoList(list: list)
    }
    
    func returnRepoList(list: BitbucketList?) {
        view?.returnRepoList(list: list)
    }
    
}
