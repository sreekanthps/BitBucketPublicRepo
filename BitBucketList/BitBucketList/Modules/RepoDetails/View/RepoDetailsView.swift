//
//  RepoDetailsView.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import UIKit
import FlexLayout
import PinLayout
import AlamofireImage


class RepoDetailsView: UIView {
    // MARK: -  Properties
    private let root: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = UIColor.hexColor(Colors.backGround)
        return uiview
    }()
    let line: UIView = UIView()
    var repoDetails: Values?
    // MARK: -  Init
    init(repoDetails: Values?) {
        // Set Lottie Animation
       super.init(frame: .zero)
       self.repoDetails = repoDetails
       configure()
       loadView()
    }
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    // MARK: - Computed Properties
    
    var userImage: UIImageView = {
       let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
       return image
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        label.textColor = .black
        return label
    }()
    private let nickNameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.textColor = .black
        return label
    }()
    
    
    // MARK: -  Methods
    func configure() {
        if let image = repoDetails?.owner?.links?.avatar?.href,
           let url = URL(string: image),
        let nickName = repoDetails?.owner?.nickname,
        let fullName = repoDetails?.owner?.displayName{
            userImage.setImage(withURL: url, placeholderImage: UIImage(named: "defaultavatar"))
            nameLabel.text = fullName
            nickNameLabel.text = nickName
        }
        
    }
    func loadView() {
        removeAllSubviewsAndRemoveFromSuperview()
        root.flex.define{ (flex) in
            flex.addItem().height(120).marginTop(30).marginHorizontal(20).paddingVertical(10).direction(.row).define { (flex) in
                flex.addItem(userImage).size(100)
                flex.addItem().marginLeft(30).justifyContent(.center).define { (flex) in
                    flex.addItem(nameLabel).marginTop(5)
                    flex.addItem(nickNameLabel).marginTop(5)
                }
                
            }
            flex.addItem().height(20)
            if let language = returnProjectLanguage() {
                flex.addItem(language).marginTop(10).height(50)
            }
            if let creation = returncreatedDetails() {
                flex.addItem(creation).marginTop(5).height(50)
            }
            if let updation = returncreatedDetails() {
                flex.addItem(updation).marginTop(5).height(50)
            }
            if let repoDetails = returnupRepoSize() {
                flex.addItem(repoDetails).marginTop(5).height(50)
            }
            if let branch = returnupBranch() {
                flex.addItem(branch).marginTop(5).height(50)
            }
        }
        addSubview(root)
    }
    
    func returnProjectLanguage() -> ImageDetailsView? {
        guard let image = repoDetails?.links?.avatar?.href,
              let language = repoDetails?.language else { return nil }
       return  ImageDetailsView(key: "Language", value: language, image: image)
        
    }
    
    func returncreatedDetails() -> ImageDetailsView? {
        guard let created = repoDetails?.createdOn?.displayStringDate else { return nil }
       return  ImageDetailsView(key: "Created On", value: created, image: nil)
        
    }
    
    func returnupdatedDetails() -> ImageDetailsView? {
        guard let created = repoDetails?.updatedOn?.displayStringDate else { return nil }
       return  ImageDetailsView(key: "Updated On", value: created, image: nil)
        
    }
    
    func returnupRepoSize() -> ImageDetailsView? {
        guard let size = repoDetails?.size else { return nil }
        return  ImageDetailsView(key: "Repo Size", value: Units(bytes: Int64(size)).getReadableUnit(), image: nil)
    }
    
    func returnupBranch() -> ImageDetailsView? {
        guard let branch = repoDetails?.mainbranch?.name else { return nil }
        return  ImageDetailsView(key: "Branch", value: branch, image: nil)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        root.pin.all()
        
        // Then let the flexbox container layout itself
        root.flex.layout()
    }
    
}
