//
//  LBExpandController.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBExpandController.h"
#import "LBExpandCell.h"
#import "LBExpandTableView.h"
@interface LBExpandController ()
@property (nonatomic, strong)LBExpandTableView *lbexpandTableView;
/// 所有组的数据
@property (nonatomic, strong)NSMutableArray *dataSourceArray;
/// 组标题
@property (nonatomic, strong)NSMutableArray *sectionTitleArray;
/// 每组展开状态
@property (nonatomic, strong)NSMutableArray *sectionStateArray;
@end

@implementation LBExpandController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"可以折叠的表示图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    /// 添加表示图数据
    [self addData];
    /// 添加表示图
    [self addTableView];
}
-(void)addTableView{
    _lbexpandTableView = [[LBExpandTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _lbexpandTableView.tableFooterView = [UIView new];
    _lbexpandTableView.sectionTitleArray = _sectionTitleArray;
    _lbexpandTableView.sectionStateArray = _sectionStateArray;
    _lbexpandTableView.dataSourceArray = _dataSourceArray;
    [self.view addSubview:_lbexpandTableView];
}
- (void)addData{
    _sectionTitleArray  = [NSMutableArray arrayWithObjects:@"一级分类",@"一级分类",@"一级分类",@"一级分类",nil];
    
    NSArray *one = @[@"1、二级分类",@"二级分类"];
    NSArray *two = @[@"2、二级分类",@"二级分类",@"二级分类"];
    NSArray *three = @[@"3、二级分类",@"二级分类",@"二级分类"];
    NSArray *four = @[@"4、二级分类",@"二级分类",@"二级分类",@"二级分类"];
    
    _dataSourceArray = [NSMutableArray arrayWithObjects:one,two,three,four, nil];
    _sectionStateArray = [NSMutableArray array];

    for (int i = 0; i < _dataSourceArray.count; i++)
    {
        /// 默认所有的组都是闭合的
        [_sectionStateArray addObject:@"0"];
    }
}



@end
