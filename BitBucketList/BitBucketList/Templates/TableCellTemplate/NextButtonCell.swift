//
//  NextButtonCell.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import Foundation
import UIKit
import FlexLayout
import PinLayout

protocol NextButtonClick {
    func onButtonClick()
}

class NextButtonCell: UITableViewCell {
    static let reuseIdentifier = "NextButtonCell"
    
    var delegate: NextButtonClick? = nil
    
    private let nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.hexColor(Colors.titleBar)
        
        return button
    }()
    
    @objc func buttonClicked(sender : UIButton){
        delegate?.onButtonClick()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        nextButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
     func layoutViews() {
        self.contentView.flex.define { (flex) in
            flex.addItem().marginVertical(10).justifyContent(.center).define { (flex) in
                flex.addItem(nextButton).height(40)
           }
           
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // 1) Set the contentView's width to the specified size parameter
        contentView.pin.width(size.width)
        
        // 2) Layout contentView flex container
        layout()
        
        // Return the flex container new size
        return contentView.frame.size
    }
    
}
