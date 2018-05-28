//
//  ProductVC.m
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ProductVC.h"
#import "ChildProductVC.h"
#import "ZWMSegmentController.h"
#import "LineFlowLayout.h"
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface ProductVC ()<UINavigationControllerDelegate>

@property (nonatomic, strong) UIView               *topView;

@property (nonatomic, strong) ZWMSegmentController *segmentVC;

@end

static NSString *cellID = @"ProductVC";
@implementation ProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationItem.title = @"产品";
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setLocationUI];
    
    [self setChildViewControllers];
}


- (BOOL)fd_prefersNavigationBarHidden{
    
    return YES;
    
}

#pragma mark---UI布局
- (void)setLocationUI{
    
    UIImageView *bgImageView = [[UIImageView alloc]init];
    bgImageView.image = [UIImage imageNamed:@"product_BgImage"];
    [self.view addSubview:bgImageView];
    
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.width.height.equalTo(self.view);
        
    }];
    
    [self.view addSubview:self.topView];
    
    UIButton *searchBtn = [[UIButton alloc]init];
    [searchBtn setImage:[UIImage imageNamed:@"Search"] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"Search"] forState:UIControlStateHighlighted];
    searchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.topView addSubview:searchBtn];
    
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.topView).offset(20);
        make.bottom.equalTo(self.topView).offset(-10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(30);
        
    }];
    
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.text = @"产品";
    titleLab.font = Font18();
    titleLab.textColor = whiteColor();
    [self.topView addSubview:titleLab];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.topView);
        make.centerY.equalTo(searchBtn);
        
    }];

}

- (UIView *)topView{
    
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, BDTopHeight)];
        _topView.backgroundColor = UIColor.clearColor;
        
    }
    return _topView;
}

///设置子控制器
- (void)setChildViewControllers{
    
    ChildProductVC *f1 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypeNow];
    ChildProductVC *f2 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypePhone];
    ChildProductVC *f3 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypeWear];
    ChildProductVC *f4 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypeMovie];
    ChildProductVC *f5 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypeFurniture];
    ChildProductVC *f6 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypePhoto];
    ChildProductVC *f7 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypeTideProduct];
    ChildProductVC *f8 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypehealthy];
    ChildProductVC *f9 = [[ChildProductVC alloc]initWithChildProductType:ChildProductTypeAI];
    
    NSArray *arr = @[f1,f9,f2,f3,f4,f5,f6,f7,f8];
    NSArray *titleArr = @[@"今日几克",@"人工智能",@"手机便携",@"智能穿戴",@"智能影音",@"航拍摄像",@"时尚潮品",@"医疗健康"];
    self.segmentVC = [[ZWMSegmentController alloc]initWithFrame:CGRectMake(0, BDTopHeight, SCREEN_WIDTH , SCREENH_HEIGHT - BDTopHeight - BDTabBarHeight) titles:titleArr];
    self.segmentVC.segmentView.showIndicateView = YES;
    self.segmentVC.segmentView.segmentNormalColor = whiteColor();
    self.segmentVC.segmentView.segmentTintColor = greenColor();
    self.segmentVC.viewControllers = [arr mutableCopy];
    if (arr.count==1) {
        self.segmentVC.segmentView.style=ZWMSegmentStyleDefault;
    } else {
        self.segmentVC.segmentView.style=ZWMSegmentStyleFlush;
    }
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
