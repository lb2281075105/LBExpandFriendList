//
//  LBQQFriendListController.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBQQFriendListController.h"
#import "LBQQFriendTableView.h"
#import "LBQQGroupModel.h"
@interface LBQQFriendListController ()
@property (nonatomic, strong)LBQQFriendTableView *qqFriendTableView;
/// 所有组的数据
@property (nonatomic, strong)NSMutableArray *dataSourceArray;
@end

@implementation LBQQFriendListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"QQ好友列表";
    self.view.backgroundColor = [UIColor whiteColor];
    /// 添加表示图数据
    [self addData];
    /// 添加表示图
    [self addTableView];
}

- (void)addTableView{
    _qqFriendTableView = [[LBQQFriendTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _qqFriendTableView.tableFooterView = [UIView new];
    _qqFriendTableView.dataSourceArray = _dataSourceArray;
    [self.view addSubview:_qqFriendTableView];
}
- (void)addData{
    /// 测试实例
    _dataSourceArray = [[NSMutableArray alloc]init];
    NSDictionary *JSONDic =@{@"group":
                                 @[
                                     @{@"groupName":@"特别关心",@"groupCount":@"3",@"groupArray":@[
                                               @{@"name":@"小明",@"avatarURL":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=8232468,2916696848&fm=27&gp=0.jpg",@"shuoshuo":@"作业又没写好,唉！",@"status":@"1"},
                                               @{@"name":@"小红",@"avatarURL":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=8232468,2916696848&fm=27&gp=0.jpg",@"shuoshuo":@"考试不要抄我的！",@"status":@"1"},
                                               @{@"name":@"小王",@"avatarURL":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=8232468,2916696848&fm=27&gp=0.jpg",@"shuoshuo":@"马勒戈壁有本事放学别走！",@"status":@"0"}
                                               ]},
                                     @{@"groupName":@"家乡",@"groupCount":@"5",@"groupArray":
                                           @[
                                               @{@"name":@"王二小",@"avatarURL":@"",@"shuoshuo":@"我家来自农村，不要欺负我",@"status":@"1"},
                                               @{@"name":@"王麻子",@"avatarURL":@"",@"shuoshuo":@"历史咯老师真漂亮！",@"status":@"1"},
                                               @{@"name":@"吴道德",@"avatarURL":@"",@"shuoshuo":@"我姓吴，法号道德",@"status":@"1"},
                                               @{@"name":@"张丝丹",@"avatarURL":@"",@"shuoshuo":@"我小名叫四蛋子，哈哈",@"status":@"0"},
                                               @{@"name":@"赵铁柱",@"avatarURL":@"",@"shuoshuo":@"我喜欢小花",@"status":@"0"}
                                               ]},
                                     @{@"groupName":@"同学",@"groupCount":@"3",@"groupArray":
                                           @[
                                               @{@"name":@"刘阿猫",@"avatarURL":@"",@"shuoshuo":@"我操，高考又到了",@"status":@"1"},
                                               @{@"name":@"静静",@"avatarURL":@"",@"shuoshuo":@"大家好，我是静静。",@"status":@"1"},
                                               @{@"name":@"隔壁老王",@"avatarURL":@"",@"shuoshuo":@"小样你是新来的吧！",@"status":@"0"}
                                               ]},
                                     @{@"groupName":@"家人",@"groupCount":@"4",@"groupArray":
                                           @[
                                               @{@"name":@"屌丝男",@"avatarURL":@"",@"shuoshuo":@"泡妞去了，回聊。",@"status":@"1"},
                                               @{@"name":@"游戏狗",@"avatarURL":@"",@"shuoshuo":@"我擦，双杀！！",@"status":@"1"},
                                               @{@"name":@"学霸",@"avatarURL":@"",@"shuoshuo":@"期末考试稳拿第一",@"status":@"1"},
                                               @{@"name":@"书呆子",@"avatarURL":@"",@"shuoshuo":@"蛋白质是怎么炼成的。。。",@"status":@"0"}]},
                                     @{@"groupName":@"老师",@"groupCount":@"3",@"groupArray":
                                           @[
                                               @{@"name":@"JAVA工程师",@"avatarURL":@"",@"shuoshuo":@"JAVA是最好的编程语言",@"status":@"1"},
                                               @{@"name":@"Android工程师",@"avatarURL":@"",@"shuoshuo":@"Android最好用，便宜耐摔！",@"status":@"1"},
                                               @{@"name":@"iOS工程师",@"avatarURL":@"",@"shuoshuo":@"iPhone手机牛逼又流畅。",@"status":@"0"}
                                               ]},
                                     @{@"groupName":@"朋友",@"groupCount":@"3",@"groupArray":
                                           @[
                                               @{@"name":@"妈妈",@"avatarURL":@"",@"shuoshuo":@"今天天气好晴朗☀️，处处好风光",@"status":@"1"},
                                               @{@"name":@"爸爸",@"avatarURL":@"",@"shuoshuo":@"农家乐！",@"status":@"1"},
                                               @{@"name":@"姐姐",@"avatarURL":@"",@"shuoshuo":@"唱歌跳舞样样精通。",@"status":@"0"}
                                               ]}
                                     ]
                             };
    
    for (NSDictionary *groupInfoDic in JSONDic[@"group"]) {
        LBQQGroupModel *model = [[LBQQGroupModel alloc]init];
        model.groupName = groupInfoDic[@"groupName"];
        model.groupCount = [groupInfoDic[@"groupCount"] integerValue];
        model.isOpened = NO;
        model.groupFriends = groupInfoDic[@"groupArray"];
        [_dataSourceArray addObject:model];
    }
}
@end
