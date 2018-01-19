//
//  LBExpandTableView.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

let LBCellHeight = 44

class LBExpandTableView: UITableView {
    lazy var sectionTitleArray = NSMutableArray()
    lazy var sectionStateArray = NSMutableArray()
    lazy var dataSourceArray:[[String]] = NSMutableArray() as! [[String]]
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        dataSource = self as! UITableViewDataSource
        delegate = self as! UITableViewDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LBExpandController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if var sectionStateArray[section] == "1" {
//            /// 组展开状态
//            let array = dataSourceArray.object(at: section)
//            return array.count
//        }
        /// 组闭合状态,返回0
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LBExpandCell.cellWithTableView(tableview: tableView)
//        cell.titleLabel.text = "\(indexPath.section)组 \(dataSourceArray[indexPath.section][indexPath.row])"
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section]
    }
}
