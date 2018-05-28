//
//  QuestionAndAnswerVC.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/28.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "QuestionAndAnswerVC.h"
#import "ZWMSegmentController.h"
#import "QuestionVC.h"
#import "AnswerVC.h"

@interface QuestionAndAnswerVC ()

@property (nonatomic, strong) ZWMSegmentController *segmentVC;

@end

@implementation QuestionAndAnswerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"产品的问答";
    
    [self setChildViewControllers];
    
}

///设置子控制器
- (void)setChildViewControllers{
    
    QuestionVC *questionVC = [[QuestionVC alloc]init];
    AnswerVC *answerVC = [[AnswerVC alloc]init];
    
    NSArray *arr = @[questionVC,answerVC];
    NSArray *titleArr = @[@"我要提问",@"我要回答"];
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
