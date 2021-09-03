//
//  RepoDetailsViewController.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import UIKit

class RepoDetailsViewController: UIViewController {
    
    // MARK: Properties
    var repoDetails: Values? = nil
    
    // MARK: Computed Properties
    private var mainView: RepoDetailsView {
        return self.view as! RepoDetailsView
    }
    
    // MARK: Initiazliers
    init(details: Values?){
        super.init(nibName: nil, bundle: Bundle.main)
        self.repoDetails = details
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
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.configureNavigationBar(largeTitleColor: .white, backgoundColor: UIColor.hexColor(Colors.titleBar), tintColor: UIColor.hexColor(Colors.titleBar), title: "Repo Details", preferredLargeTitle: false)
        let backButton = UIBarButtonItem()
            backButton.title = ""
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func loadView() {
        let view = RepoDetailsView(repoDetails: repoDetails)
        self.view = view
    }
}
