//
//  ProductDetialVC.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/22.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ProductDetialVC.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "Util.h"
#import "ZWMSegmentController.h"

///子控制器
#import "ProductSummarizeVC.h"
#import "ShowScoreVc.h"
#import "ShowCommonVC.h"
#import "ProductAppraisalVC.h"
#import "ShowAskAndAnswerVC.h"

@interface ProductDetialVC ()

@property (nonatomic, strong) UIView      *topView;
@property (nonatomic, strong) UIImageView *topBgimageV;
@property (nonatomic, strong) UIButton    *backBtn;

@property (nonatomic, strong) ZWMSegmentController *segmentVC;

@end

@implementation ProductDetialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLocationUI];
    
    [self setChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (BOOL)fd_prefersNavigationBarHidden{
    
    return YES;
    
}

#pragma mark---设置UI
- (void)setLocationUI{
    
    [self.view addSubview:self.topView];
    [self.topBgimageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.width.height.equalTo(self.topView);
        
    }];
    
    self.backBtn = [[UIButton alloc]init];
    self.backBtn.backgroundColor = UIColor.redColor;
    [self.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.backBtn];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.topView).offset(20);
        make.centerY.equalTo(self.topView).offset(20);
        make.width.height.mas_equalTo(20);
        
    }];
    
}

#pragma mark---设置子控制器
- (void)setChildViewControllers{
    
    ProductSummarizeVC *summarizeVC = [[ProductSummarizeVC alloc]init];
    ShowScoreVc *scoreVC = [[ShowScoreVc alloc]init];
    ShowCommonVC *commontVC = [[ShowCommonVC alloc]init];
    ProductAppraisalVC *appraisalVC = [[ProductAppraisalVC alloc]init];
    ShowAskAndAnswerVC *askAndAnswer = [[ShowAskAndAnswerVC alloc]init];
    
    NSArray *arr = @[summarizeVC,scoreVC,commontVC,appraisalVC,askAndAnswer];
    NSArray *titleArr = @[@"概述",@"评分",@"评论",@"测评",@"问答"];
    self.segmentVC = [[ZWMSegmentController alloc]initWithFrame:CGRectMake(0, 130, SCREEN_WIDTH , SCREENH_HEIGHT - BDTopHeight ) titles:titleArr];
    self.segmentVC.segmentView.segmentNormalColor = UIColor.blackColor;
    self.segmentVC.segmentView.segmentTintColor = greenColor();
    self.segmentVC.viewControllers = [arr mutableCopy];
    self.segmentVC.segmentView.style=ZWMSegmentStyleDefault;
    [self addSegmentController:self.segmentVC];
    [self.segmentVC  setSelectedAtIndex:0];
    
}

- (void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark---懒加载
- (UIView *)topView{
    
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
        
        UIImageView *imagView = [[UIImageView alloc]init];
        imagView.image = [UIImage imageNamed:@"product_BgImage"];
        imagView.contentMode = UIViewContentModeCenter;
        imagView.clipsToBounds = YES;
        self.topBgimageV = imagView;
        [_topView addSubview:imagView];
        
        UILabel *titleLab = [Util labelWithTitle:@"iPhone S" WithFont:Font18() WithTextColor:whiteColor()];
        [_topView addSubview:titleLab];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerY.equalTo(self.topView).offset(20);
            make.centerX.equalTo(self.topView);
            
        }];
        
    
    }
    return _topView;
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
