//
//  HomeVC.m
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "HomeVC.h"
#import "FirstVC.h"
#import "ZWMSegmentController.h"
#import "ProductAppraisalCell.h"
#import "QuestionAndAnswerVC.h"
#import "WriteCommonGradeVC.h"

@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *cellID = @"HomeVC";
@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发现";
    [self setNavigationBarItems];
    [self.view addSubview:self.tableView];

}

#pragma mark---设置item
- (void)setNavigationBarItems{
    
    self.navigationController.navigationBar.barTintColor = UIColor.whiteColor;
    
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    searchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [searchBtn setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    self.navigationItem.leftBarButtonItem = searchItem;
    
    UIButton *writeTextBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    [writeTextBtn setTitleColor:greenColor() forState:UIControlStateNormal];
    [writeTextBtn setTitle:@"写评论" forState:UIControlStateNormal];
    [writeTextBtn rounded:4 width:0.5 color:greenColor()];
    writeTextBtn.titleLabel.font = Font14();
    [writeTextBtn addTarget:self action:@selector(gotoAnswerAndQuestionVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *writeItem = [[UIBarButtonItem alloc]initWithCustomView:writeTextBtn];
    self.navigationItem.rightBarButtonItem = writeItem;
    
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, BDTopHeight, SCREEN_WIDTH, SCREENH_HEIGHT - BDTopHeight - BDTabBarHeight) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.delegate =self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[ProductAppraisalCell class] forCellReuseIdentifier:cellID];
        
    }
    
    return _tableView;
    
}

#pragma mark---UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductAppraisalCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 375;
    
}

#pragma mark---点击事件
- (void)gotoAnswerAndQuestionVC{
    
    WriteCommonGradeVC *question = [[WriteCommonGradeVC alloc]init];
    question.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:question animated:YES];
    
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
