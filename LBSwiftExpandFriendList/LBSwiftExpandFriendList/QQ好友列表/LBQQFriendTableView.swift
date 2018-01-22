//
//  LBQQFriendTableView.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/22.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit
import ObjectiveC.runtime
//import <objc/runtime.h>
let buttonKey = "buttonKey";

//let DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)
class LBQQFriendTableView: UITableView {
    lazy var modelArray:[LBQQGroupModel] = [LBQQGroupModel]()

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(LBQQFriendCell.self, forCellReuseIdentifier: "LBQQFriendCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LBQQFriendTableView:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LBQQFriendCell") as! LBQQFriendCell
        cell.textLabel?.text = modelArray[indexPath.row].sectionName
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /// 组头
        let sectionView = UIView(frame: CGRect.init(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: LBCellHeight))
        sectionView.backgroundColor = UIColor.white
        let groupModel = modelArray[section]
        /// 添加头按钮
        let button = UIButton(type: .custom)
        button.frame = sectionView.bounds
        button.tag = section + 1
        button.addTarget(self, action: #selector(LBQQFriendTableView.sectionButtonClick(button:)), for: .touchUpInside)
        sectionView.addSubview(button)
        /// 线
        let line = UIImageView(frame: CGRect(x: 0, y: button.frame.size.height - 1, width: button.frame.size.width, height: 1))
        line.image = UIImage(named: "line")
        sectionView.addSubview(line)
        let imgView = UIImageView(frame: CGRect(x: 10, y: (44-16)/2, width: 14, height: 16))
        sectionView.addSubview(imgView)
        
//        if (groupModel.isOpened) {
//
//            imgView.image = UIImage(named: "rightArrow")
//            CGAffineTransform currentTransform = imgView.transform;
//            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2); // 在现在的基础上旋转指定角度
//            imgView.transform = newTransform;
//            objc_setAssociatedObject(button, buttonKey, imgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//
//        }else{
//            [imgView setImage:[UIImage imageNamed:@"rightArrow"]];
//            objc_setAssociatedObject(button, buttonKey, imgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        }
        /// 添加组标题
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.text = groupModel.sectionName
        button.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(34)
            make.centerY.equalTo(button)
        }
        /// 折叠状态
        let numberLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width - 40, y: (44 - 20) / 2, width: 40, height: 20))
        numberLabel.backgroundColor = UIColor.clear
        numberLabel.font = UIFont.systemFont(ofSize: 14)
        
        var onLineCount = 0;

        for friendInfoDic in groupModel.rows!{
            if (friendInfoDic["status"] as!String == "1") {
                onLineCount = onLineCount + 1
            }
        }
        numberLabel.text = "\(onLineCount)/\(groupModel.sectionCount)"
        sectionView.addSubview(numberLabel)

        return sectionView;
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(LBCellHeight)
    }
}

extension LBQQFriendTableView{
    @objc func sectionButtonClick(button:UIButton){
        let groupModel = modelArray[button.tag - 1]
        
        let imageView =  objc_getAssociatedObject(button,buttonKey);
        
        if (groupModel.isOpened) {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .allowUserInteraction, animations: {
            
//                CGAffineTransform(); currentTransform = imageView.transform;
                
                
//                CGAffineTransform() newTransform = CGAffineTransformRotate(imageView.t, -M_PI/2);
//                // 在现在的基础上旋转指定角度
//                imageView.transform = newTransform;
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.allowUserInteraction,.curveLinear], animations: {
//                CGAffineTransform currentTransform = imageView.transform;
//                CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2);
//                // 在现在的基础上旋转指定角度
//                imageView.transform = newTransform;
            }, completion: nil)
        }
        
        groupModel.isOpened = !groupModel.isOpened;
        /// 刷新组
        let indexSet = NSIndexSet.init(index: button.tag - 1) as IndexSet
        reloadSections(indexSet, with: .automatic)

    }
}
