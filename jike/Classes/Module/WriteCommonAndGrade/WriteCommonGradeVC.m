//
//  WriteCommonGradeVC.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/28.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "WriteCommonGradeVC.h"
#import "ZWMSegmentController.h"
#import "CommonViewController.h"
#import "AddGradeVC.h"

@interface WriteCommonGradeVC ()

@property (nonatomic, strong) ZWMSegmentController *segmentVC;

@end

@implementation WriteCommonGradeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setChildViewControllers];
    
}

///设置子控制器
- (void)setChildViewControllers{
    
    CommonViewController *commonVC = [[CommonViewController alloc]init];
    AddGradeVC *gradeVC = [[AddGradeVC alloc]init];
    
    NSArray *arr = @[commonVC,gradeVC];
    NSArray *titleArr = @[@"评论",@"评分"];
    self.segmentVC = [[ZWMSegmentController alloc]initWithFrame:CGRectMake(0, BDTopHeight, SCREEN_WIDTH , SCREENH_HEIGHT - BDTopHeight - BDTabBarHeight) titles:titleArr];
    self.segmentVC.segmentView.segmentNormalColor = UIColor.grayColor;
    self.segmentVC.segmentView.segmentTintColor = greenColor();
    self.segmentVC.viewControllers = [arr mutableCopy];
    self.segmentVC.segmentView.style=ZWMSegmentStyleDefault;
    //    [self.segmentVC  enumerateBadges:@[@(1),@10]];
    [self addSegmentController:self.segmentVC];
    [self.segmentVC  setSelectedAtIndex:0];
    
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
