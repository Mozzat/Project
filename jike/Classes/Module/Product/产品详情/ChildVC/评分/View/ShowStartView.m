//
//  ShowStartView.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/27.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ShowStartView.h"

@implementation ShowStartView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        for (NSInteger index = 0; index < 5 ; index ++) {
            
            ShowScoreView *scoreView = [[ShowScoreView alloc]initWithFrame:CGRectMake(0, index * 30, 150, 15)];
            [self addSubview:scoreView];
            
            scoreView.startLab.text = [NSString stringWithFormat:@"%ld星", 5 -index];
            scoreView.count = 0.3 + 0.1 * index;
            
        }
        
    }
    return self;
}

@end

@implementation ShowScoreView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.startLab];
        [self addSubview:self.lineView];
        [self addSubview:self.amountLab];
        
    }
    return self;
}

///懒加载
- (UILabel *)startLab{
    
    if (!_startLab) {
        _startLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 15)];
        _startLab.text = @"5星";
        _startLab.font =Font14();
        _startLab.textColor = UIColor.blackColor;
        
    }
    return _startLab;
    
}

- (UIView *)lineView{
    
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(35, 0, 115, 15)];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)HexColor(@"FFA500").CGColor, (__bridge id)HexColor(@"FFD700").CGColor];
        gradientLayer.locations = @[@0.0, @0.5, @1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
        gradientLayer.frame = CGRectMake(0, 0, 115, 15);
        [_lineView.layer addSublayer:gradientLayer];
        
    }
    return _lineView;
}

-(UILabel *)amountLab{
    
    if (!_amountLab ) {
        
        _amountLab = [[UILabel alloc]initWithFrame:CGRectMake(35, 0, 120, 15)];
        _amountLab.textColor = UIColor.grayColor;
        _amountLab.font =Font12();
        _amountLab.text = @"26.7%";
        _amountLab.backgroundColor = UIColor.whiteColor;
        
    }
    return _amountLab;
}

- (void)setCount:(float)count{
    
    _count = count;
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
       
        self.amountLab.x = count * 115 + 35;
        self.amountLab.width = (1 - count) * 120;
        
    } completion:^(BOOL finished) {
        
    }];
    
}

@end
