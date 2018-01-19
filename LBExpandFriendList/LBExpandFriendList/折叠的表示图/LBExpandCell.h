//
//  LBExpandCell.h
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface LBExpandCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableview;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
