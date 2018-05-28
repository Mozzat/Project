//
//  ShowScoreVc.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/25.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ShowScoreVc.h"
#import "XHStarRateView.h"
#import "ShowStartView.h"

@interface ShowScoreVc ()

@property (nonatomic, strong) UILabel   *productScount;

@property (nonatomic, strong) UILabel   *peopleLab;

@property (nonatomic, strong) ShowStartView *startView;

@property (nonatomic, strong)  UILabel   *costLab;

@property (nonatomic, strong)  UILabel   *performanceLab;

@property (nonatomic, strong)  UILabel   *enduranceLab;

@property (nonatomic, strong)  UILabel   *appearanceLab;

@property (nonatomic, strong)  UILabel   *bottomLab;


@end

@implementation ShowScoreVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLocationUI];
}


#pragma mark---设置UI
- (void)setLocationUI{
    
    [self.view addSubview:self.productScount];
    [self.view addSubview:self.peopleLab];
    [self.view addSubview:self.costLab];
    [self.view addSubview:self.performanceLab];
    [self.view addSubview:self.enduranceLab];
    [self.view addSubview:self.appearanceLab];
    [self.view addSubview:self.bottomLab];
    
    [self.productScount mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view.mas_centerX).offset(-5);
        make.top.equalTo(self.view).offset(60);
        
    }];
    
    [self.peopleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.productScount.mas_right).offset(10);
        make.bottom.equalTo(self.productScount).offset(-5);
        
    }];
    
    XHStarRateView *starRateView4 = [[XHStarRateView alloc] initWithFrame:CGRectMake(self.view.centerX, 60, 90, 15) numberOfStars:5 rateStyle:HalfStar isAnination:YES finish:^(CGFloat currentScore) {
        NSLog(@"4----  %f",currentScore);
    }];
    starRateView4.currentScore = 4;
    starRateView4.userInteractionEnabled = NO;
    [self.view addSubview:starRateView4];
    
    self.startView = [[ShowStartView alloc]init];
    [self.view addSubview:self.startView];
    
    [self.startView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.productScount.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(150);
        
    }];
    
    [self.costLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.startView.mas_bottom).offset(20);
        make.right.equalTo(self.view.mas_centerX).offset(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        
    }];
    
    [self.performanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.startView.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_centerX).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        
    }];
    
    [self.enduranceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.costLab.mas_bottom).offset(10);
        make.right.equalTo(self.view.mas_centerX).offset(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        
    }];
    
    [self.appearanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.performanceLab.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_centerX).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        
    }];
    
    [self.bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.appearanceLab.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        
    }];
    
}

#pragma mark---懒加载
- (UILabel *)productScount{
    
    if (!_productScount) {
        _productScount = [[UILabel alloc]init];
        _productScount.text = @"8.0";
        _productScount.textColor = greenColor();
        _productScount.font = Font36();
        
    }
    
    return _productScount;
}

- (UILabel *)peopleLab{
    
    if (!_peopleLab) {
        _peopleLab = [[UILabel alloc]init];
        _peopleLab.text = @"723人评分";
        _peopleLab.textColor = UIColor.blackColor;
        _peopleLab.font = Font14();
        
    }
    return _peopleLab;
}

- (UILabel *)costLab{
    
    if (!_costLab) {
        _costLab = [[UILabel alloc]init];
        _costLab.text = @"性价比 5.8";
        _costLab.font =Font14();
        [_costLab rounded:14 width:0.5 color:greenColor()];
        _costLab.textAlignment = NSTextAlignmentCenter;
    }
    return _costLab;
}

- (UILabel *)performanceLab{
    
    if (!_performanceLab) {
        _performanceLab = [[UILabel alloc]init];
        _performanceLab.text = @"性能 5.8";
        [_performanceLab rounded:14 width:0.5 color:greenColor()];
        _performanceLab.font =Font14();
        _performanceLab.textAlignment = NSTextAlignmentCenter;
    }
    return _performanceLab;
}

- (UILabel *)enduranceLab{
    
    if (!_enduranceLab) {
        _enduranceLab = [[UILabel alloc]init];
        _enduranceLab.text = @"性能 5.8";
        [_enduranceLab rounded:14 width:0.5 color:greenColor()];
        _enduranceLab.font =Font14();
        _enduranceLab.textAlignment = NSTextAlignmentCenter;
    }
    return _enduranceLab;
    
}

- (UILabel *)appearanceLab{
    
    if (!_appearanceLab) {
        _appearanceLab = [[UILabel alloc]init];
        _appearanceLab.text = @"性能 5.8";
        [_appearanceLab rounded:14 width:0.5 color:greenColor()];
        _appearanceLab.font =Font14();
        _appearanceLab.textAlignment = NSTextAlignmentCenter;
    }
    return _appearanceLab;
    
}

- (UILabel *)bottomLab{
    
    if (!_bottomLab) {
        _bottomLab = [[UILabel alloc]init];
        _bottomLab.textAlignment = NSTextAlignmentCenter;
        _bottomLab.text = @"在热门排名第1名";
        _bottomLab.font =Font14();
        _bottomLab.textColor = UIColor.greenColor;
        
    }
    return _bottomLab;
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
