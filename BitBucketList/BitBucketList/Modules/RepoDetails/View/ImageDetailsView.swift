//
//  ImageDetailsView.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import UIKit
import FlexLayout
import PinLayout

class ImageDetailsView: UIView {
    // MARK: -  Properties
    let root: UIView = UIView()
    var leftString: String?
    var rightString: String?
    var imageString: String?
    var linSeperator: Bool = false
    // MARK: -  Init
    init(key: String?, value: String?, image: String?, line: Bool = true) {
        // Set Lottie Animation
       super.init(frame: .zero)
        self.leftString = key
        self.rightString = value
        self.imageString = image
        self.linSeperator = line
       configure()
       loadView()
    }
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    // MARK: - Computed Properties
    
   
    var projectimage: UIImageView = {
       let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
       return image
    }()
    private let leftLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        label.textColor = .black
        return label
    }()
    private let rightLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        label.textColor = .black
        return label
    }()
    private let lineseperator : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.hexColor(Colors.titleBar)
        return view
    }()
    
    // MARK: -  Methods
    func configure() {
        leftLabel.text = leftString
        rightLabel.text = rightString
        if let image = imageString {
            projectimage.setImage(from: image)
        }
     }
    func loadView() {
        removeAllSubviewsAndRemoveFromSuperview()
        root.flex.define { (flex) in
            flex.addItem().marginHorizontal(20).direction(.row).define { (flex) in
                flex.addItem(projectimage)
                flex.addItem(leftLabel).width(Constants.rightWidth)
                flex.addItem(rightLabel).width(Constants.leftWidth)
                
            }
            if linSeperator {
                flex.addItem(lineseperator).height(1).marginHorizontal(20).marginTop(8)
            }
            
            
        }
        addSubview(root)
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
