//
//  RepoListView.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import Foundation
import UIKit
import FlexLayout
import PinLayout


class RepoListView: UIView {
    
    // MARK: -  Initializers
    init() {
        super.init(frame: .zero)
        configure()
        layout()
    }
    
    convenience init(delegate: TableViewDelegateProtocol?) {
        self.init()
        self.delegate = delegate
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: -  Properties
    private let rootView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = UIColor.hexColor(Colors.backGround)
        return uiview
    }()
    var tableView = UITableView()
    var delegate: TableViewDelegateProtocol?
    // MARK: -  Configiration
    private func configure() {
          tableView.tableFooterView = UIView()
          tableView.backgroundColor = UIColor.hexColor(Colors.backGround)
          tableView.delegate = self
          tableView.dataSource = self
          tableView.separatorStyle = .none
          tableView.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.reuseIdentifier)
          tableView.register(NextButtonCell.self, forCellReuseIdentifier: NextButtonCell.reuseIdentifier)
          tableView.estimatedRowHeight = 90
          tableView.showsVerticalScrollIndicator = false
          
      }
    // MARK: -  View alignment
    func layout() {
        removeAllSubviewsAndRemoveFromSuperview()
        rootView.flex.define { (flex) in
            flex.addItem(tableView).marginHorizontal(15).marginTop(60).marginBottom(40).height(Constants.tableHeight)
        }
        addSubview(rootView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootView.pin.all()
        rootView.flex.layout()
    }
    
}

extension RepoListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberofRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rows = delegate?.numberofRows() else { return UITableViewCell() }
        if indexPath.row == rows - 1 {
            guard let cell =  tableView.dequeueReusableCell(withIdentifier: NextButtonCell.reuseIdentifier, for: indexPath) as? NextButtonCell else { return UITableViewCell()}
            cell.delegate = self
            return cell
        } else {
            guard let cell =  tableView.dequeueReusableCell(withIdentifier: ListViewCell.reuseIdentifier, for: indexPath) as? ListViewCell else { return UITableViewCell()}
            guard let data = delegate?.dataforCell(index: indexPath.row) as? Values,
                  let name = data.name, let type = data.type,
                  let date = data.createdOn?.displayStringDate,
                let avatar = data.links?.avatar?.href else { return UITableViewCell() }
            cell.configure(withName: name, type: type, date: date,image: avatar)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelectRecord(index: indexPath.row)
    }
    
}

extension RepoListView: NextButtonClick {
    func onButtonClick() {
        delegate?.onSelectRecord(index: -1)
    }
}
