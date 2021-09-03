//
//  RepoListRouter.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import Foundation
import UIKit

class RepoListRouter: RepoListPresentertoRouterProtocol {

    static func createModule() -> UIViewController {
        let view = RepoListViewController()
        let presenter: RepoListViewtoPresenterProtocol & RepoListInteractortoPresenterProtocol = RepoListPresenter()
        let interactor:RepoListPresentertoInteractorProtocol  = RepoListInteractor()
        let router: RepoListPresentertoRouterProtocol = RepoListRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
