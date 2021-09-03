//
//  RepoListProtocol.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import Foundation
import UIKit

protocol RepoListPresentertoViewProtocol: class {
    func returnRepoList(list: BitbucketList?)
    func returnNextRepoList(list: BitbucketList?)
}

protocol RepoListInteractortoPresenterProtocol: class {
    func returnRepoList(list: BitbucketList?)
    func returnNextRepoList(list: BitbucketList?)
}

protocol RepoListPresentertoInteractorProtocol: class {
    var presenter: RepoListInteractortoPresenterProtocol? { get set }
    func getRepoList()
    func getNextRepo(withUrl url: String)
}

protocol RepoListViewtoPresenterProtocol: class {
    var view: RepoListPresentertoViewProtocol? { get set }
    var interactor: RepoListPresentertoInteractorProtocol? { get set }
    var router:RepoListPresentertoRouterProtocol? { get set }
    func getRepoInfo()
    func getNextRepo(withUrl url: String)
    
}

protocol RepoListPresentertoRouterProtocol: class {
    static func createModule() -> UIViewController
}
