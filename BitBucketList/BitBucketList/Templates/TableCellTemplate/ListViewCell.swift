//
//  ListViewCell.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import UIKit
import FlexLayout
import PinLayout

class ListViewCell: UITableViewCell {
    static let reuseIdentifier = "ListViewCell"
     var contactImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        return image
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        label.textColor = .black
        return label
    }()
    private var typeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        return label
    }()
   
    private var creationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contactImage.contentMode = .scaleAspectFill
    }
    func configure(withName name: String?, type: String?, date: String?, image: String?) {
        nameLabel.text = name
        typeLabel.text = type
        creationLabel.text = date
        guard let img = image , let url = URL(string: img) else { return }
        contactImage.setImage(withURL: url,placeholderImage: UIImage(named: "defaultavatar"))
       
    }
    
    func layoutViews() {
        self.contentView.flex.define { (flex) in
            flex.addItem().marginVertical(10).define { (flex) in
                flex.addItem().direction(.row).define { (flex) in 
                    flex.addItem(contactImage).marginLeft(10).size(60)
                    flex.addItem().marginLeft(15).marginRight(0).define { (flex) in
                        flex.addItem(nameLabel)
                        flex.addItem(typeLabel).marginTop(5)
                        flex.addItem(creationLabel).marginTop(5)
                    }
                }
                
           }
           
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    func layout() {
        contentView.flex.layout(mode: .adjustWidth)
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
