//
//  LBQQGroupModel.h
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBQQGroupModel : NSObject
@property (nonatomic, assign)BOOL isOpened;
@property (nonatomic, retain)NSString *groupName;
@property (nonatomic, assign)NSInteger groupCount;
@property (nonatomic, retain)NSArray *groupFriends;
@end
