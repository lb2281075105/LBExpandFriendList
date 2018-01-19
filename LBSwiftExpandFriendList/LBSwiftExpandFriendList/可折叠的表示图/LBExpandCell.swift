//
//  LBExpandCell.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

class LBExpandCell: UITableViewCell {
    lazy var titleLabel:UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
extension LBExpandCell{
    class func cellWithTableView(tableview:UITableView) -> LBExpandCell{
        let cell = tableview.dequeueReusableCell(withIdentifier: "LBExpandCell") as! LBExpandCell
//        if !cell {
//
//        }
        
        
        return cell
    }
}
