//
//  LBExpandController.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBExpandController.h"
#import "LBExpandCell.h"
@interface LBExpandController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *lbexpandTableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property (nonatomic, strong)NSMutableArray *sectionArray;
@property (nonatomic, strong)NSMutableArray *stateArray;

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
    _lbexpandTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _lbexpandTableView.dataSource = self;
    _lbexpandTableView.delegate =  self;
    _lbexpandTableView.tableFooterView = [UIView new];
    [_lbexpandTableView registerNib:[UINib nibWithNibName:@"ExpandCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_lbexpandTableView];
}
- (void)addData{
    _sectionArray  = [NSMutableArray arrayWithObjects:@"一级分类",
                     @"一级分类",
                     @"一级分类",
                     @"一级分类",nil];
    
    NSArray *one = @[@"二级分类",@"二级分类",@"二级分类"];
    NSArray *two = @[@"二级分类",@"二级分类",@"二级分类"];
    NSArray *three = @[@"二级分类",@"二级分类",@"二级分类"];
    NSArray *four = @[@"二级分类",@"二级分类",@"二级分类",@"二级分类"];
    
    _dataSource = [NSMutableArray arrayWithObjects:one,two,three,four, nil];
    _stateArray = [NSMutableArray array];
    
    for (int i = 0; i < _dataSource.count; i++)
    {
        //所有的分区都是闭合
        [_stateArray addObject:@"0"];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBExpandCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell.listLabel.textAlignment = NSTextAlignmentLeft;
//    cell.listLabel.text = _dataSource[indexPath.section][indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sectionArray[section];
}


@end
