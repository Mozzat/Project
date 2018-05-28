//
//  ProductSummarizeVC.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/25.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ProductSummarizeVC.h"
#import "SummarizeTopView.h"
#import "SummarizeMiddleView.h"
#import "SummarizeBottomView.h"

@interface ProductSummarizeVC ()

@property (nonatomic, strong) SummarizeTopView    *topView;
@property (nonatomic, strong) SummarizeMiddleView *middleView;
@property (nonatomic, strong) SummarizeBottomView *bottomView;
@property (nonatomic, strong) UIButton  *moreParametersBtn;

@end

@implementation ProductSummarizeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLocationUI];
    
}

#pragma mark---设置UI
- (void)setLocationUI{
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.middleView];
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.moreParametersBtn];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(10);
        make.left.right.equalTo(self.view);
        
    }];
    
    [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(220);
        
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.middleView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(100);
        
    }];
    
    [self.moreParametersBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.bottomView.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(20);
        
    }];
    
}

#pragma mark---懒加载
- (SummarizeTopView *)topView{
    
    if (!_topView) {
        _topView = [[SummarizeTopView alloc]init];
        
    }
    return _topView;
}

- (SummarizeMiddleView *)middleView{
    
    if (!_middleView) {
        _middleView = [[SummarizeMiddleView alloc]init];
        
    }
    return _middleView;
    
}

- (SummarizeBottomView *)bottomView{
    
    if (!_bottomView) {
        _bottomView = [[SummarizeBottomView alloc]init];
    
    }
    return _bottomView;
    
}

- (UIButton *)moreParametersBtn{
    
    if (!_moreParametersBtn) {
        _moreParametersBtn = [[UIButton alloc]init];
        [_moreParametersBtn setTitle:@"更多参数 >>" forState:UIControlStateNormal];
        [_moreParametersBtn setTitleColor:greenColor() forState:UIControlStateNormal];
        
    }
    return _moreParametersBtn;
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
