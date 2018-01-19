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
        let cell = tableView.dequeueReusableCell(withIdentifier: "LBExpandCell") as!LBExpandCell
//        cell.titleLabel.text = "\(indexPath.section)组 \(dataSourceArray[indexPath.section][indexPath.row])"
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section]
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /// 添加按钮到组头视图
        let button = UIButton.init(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: LBCellHeight)
        button.tag = section + 1
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(LBExpandController.sectionButtonClick), for: .touchUpInside)
        
//        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 60)];
        /// 添加底部线
        
        let line = UIImageView()
        line.image = UIImage.init(named: "line")
        button.addSubview(line)
        
        
        

//        [line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(button);
//        make.top.equalTo(button.mas_top).offset(LBCellHeight - 1);
//        make.centerY.equalTo(button);
//        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
//        make.height.equalTo(@1);
//        }];
//        /// 添加左边图标
//        UIImageView *leftImgView = [[UIImageView alloc]init];
//        [leftImgView setImage:[UIImage imageNamed:@"circle"]];
//        [button addSubview:leftImgView];
//        [leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.equalTo(@24);
//        make.left.equalTo(button).offset(10);
//        make.centerY.equalTo(button);
//        }];
//        /// 添加右边的箭头
//        UIImageView *arrowImgView = [[UIImageView alloc]init];
//        [button addSubview:arrowImgView];
//        [arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.equalTo(@10);
//        make.centerY.equalTo(button);
//        make.left.equalTo(button.mas_left).offset([UIScreen mainScreen].bounds.size.width - 30);
//        }];
////        if ([_sectionStateArray[section] isEqualToString:@"0"]) {
////            arrowImgView.image = [UIImage imageNamed:@"bottomArrow"];
////        }else if ([_sectionStateArray[section] isEqualToString:@"1"]) {
////            arrowImgView.image = [UIImage imageNamed:@"topArrow"];
////        }
//        /// 每组个数
//        UILabel *countLabel = [[UILabel alloc]init];
//        [countLabel setBackgroundColor:[UIColor clearColor]];
//        countLabel.font = [UIFont systemFontOfSize:14];
//        countLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)[_dataSourceArray[section] count]];
//        [button addSubview:countLabel];
//        [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(button);
//        make.right.equalTo(arrowImgView.mas_left).offset(- 20);
//        }];
//        /// 组标题
//        UILabel *sectionTitleLabel = [[UILabel alloc]init];
//        [sectionTitleLabel setBackgroundColor:[UIColor clearColor]];
//        sectionTitleLabel.font = [UIFont systemFontOfSize:14];
//        sectionTitleLabel.text = _sectionTitleArray[section];
//        [button addSubview:sectionTitleLabel];
//        [sectionTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(button);
//        make.left.equalTo(leftImgView.mas_right).offset(15);
//        }];
        return button;
    }
}
extension LBExpandController{
    @objc func sectionButtonClick(){
        
    }
}
