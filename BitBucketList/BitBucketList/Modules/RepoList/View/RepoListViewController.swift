//
//  RepoListViewController.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import UIKit

protocol TableViewDelegateProtocol {
    func numberofRows() -> Int
    var numberofSections: Int{get}
    func onSelectRecord(index: Int)
    func dataforCell(index: Int) -> Any?
}
class RepoListViewController: UIViewController {
    var bitbucketList: BitbucketList? = nil
    private var mainView: RepoListView {
        return self.view as! RepoListView
    }
    
    // MARK: -  Properties
    var presenter: RepoListViewtoPresenterProtocol?
    
    // MARK: -  Initializers
    init(){
        super.init(nibName: nil, bundle: Bundle.main)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // MARK: -  ViewController lifecycle methods
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getRepoInfo()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.getRepoInfo()
    }
    override func loadView() {
        let view = RepoListView(delegate: self)
        self.view = view
    }
}

extension RepoListViewController: RepoListPresentertoViewProtocol {
    func returnNextRepoList(list: BitbucketList?) {
        guard let newList = list?.values else {return}
        self.bitbucketList?.values?.append(contentsOf: newList)
        self.bitbucketList?.next = list?.next ?? nil
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
        }
    }
    
    func returnRepoList(list: BitbucketList?) {
        guard let contact = list else { return }
        self.bitbucketList = contact
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
        }
    }
    
}
extension RepoListViewController: TableViewDelegateProtocol {
    func dataforCell(index: Int) -> Any? {
        guard let list = self.bitbucketList?.values , list.count > index  else { return nil}
        return list[index]
    }
    
    func numberofRows() -> Int {
        guard let count = self.bitbucketList?.values?.count else { return 0 }
        guard let _ = self.bitbucketList?.next else {return count}
        return count + 1
    }
    
    var numberofSections: Int {
        return 0
    }
    
    func onSelectRecord(index: Int) {
        if index == -1 {
            guard let nextReq = self.bitbucketList?.next ,
                  let url = URL(string: nextReq),
                  let params = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.first?.value else { return }
            presenter?.getNextRepo(withUrl: params)
        } else {
            if let recrods = self.bitbucketList?.values, recrods.count >= index{
                let record = recrods[index]
                let detailsVC = RepoDetailsViewController(details: record)
                self.navigationController?.pushViewController(detailsVC, animated: false)
            }
             
        }
    }
    
    
}
