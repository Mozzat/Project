//
//  PersonalVC.m
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "PersonalVC.h"
#import "LoginVC.h"
#import "BaseNavigationController.h"

@interface PersonalVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *cellID = @"PersonalVC";
@implementation PersonalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLocationUI];
    
}

#pragma mark--设置UI
- (void)setLocationUI{
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark--懒加载
- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, BDTopHeight, SCREEN_WIDTH, SCREENH_HEIGHT - BDTopHeight - BDTabBarHeight) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        
        UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        UIButton *headBtn = [[UIButton alloc]init];
        headBtn.backgroundColor = UIColor.grayColor;
        [headBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [headBtn rounded:35];
        [headView addSubview:headBtn];
        
        [headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(headView);
            make.left.equalTo(headView).offset(20);
            make.width.height.mas_equalTo(70);
            
        }];
        
        UILabel *realNameLab = [[UILabel alloc]init];
        realNameLab.text = @"史蒂芬·陶";
        realNameLab.textColor = blackColor();
        [headView addSubview:realNameLab];
        
        [realNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(headBtn).offset(10);
            make.left.equalTo(headBtn.mas_right).offset(20);
            
        }];
        
        _tableView.tableHeaderView = headView;
        
    }
    
    return _tableView;
    
}

#pragma mark---UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    NSArray *titleArr = @[@"我的消息",@"我的收藏",@"我的测评",@"我的问答",@"设置"];
    cell.textLabel.text = titleArr[indexPath.row];
    
    return cell;
    
}

#pragma mark---点击事件
- (void)login{
    
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:[[LoginVC alloc]init]];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
