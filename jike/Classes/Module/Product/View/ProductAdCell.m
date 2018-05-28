//
//  ProductAdCell.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/22.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ProductAdCell.h"
@interface ProductAdCell()

@property (nonatomic, strong)  UIImageView  *adImageV;

@property (nonatomic, strong) UIView    *bottomView;

@property (nonatomic, strong) UILabel   *productTitleLab;

@property (nonatomic, strong) UILabel   *productScount;

@property (nonatomic, strong) UILabel   *peopleLab;

@property (nonatomic, strong) UILabel   *contentLab;

@property (nonatomic, strong) UIButton  *collectionBtn;

@property (nonatomic, strong) UIButton  *shareBtn;

@property (nonatomic, strong) UIButton  *summarizeBtn;

@end
@implementation ProductAdCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startScroller) name:@"PeoductScrollerStrat" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endScroller) name:@"PeoductScrollerEnd" object:nil];
        [self.contentView addSubview:self.adImageV];
        
//        [self setLocationUI];
    }
    return self;
}

///设置UI
- (void)setLocationUI{
    
    [self.contentView addSubview:self.bottomView];
    [self.bottomView addSubview:self.productTitleLab];
    [self.bottomView addSubview:self.productScount];
    [self.bottomView addSubview:self.peopleLab];
    [self.bottomView addSubview:self.contentLab];
    [self.bottomView addSubview:self.summarizeBtn];
    [self.bottomView addSubview:self.shareBtn];
    [self.bottomView addSubview:self.collectionBtn];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(self.contentView.width - 50);
        make.height.mas_equalTo(210);
        
    }];
    
    [self.productTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(self.bottomView).offset(5);
        
    }];
    
    [self.productScount mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.bottomView).offset(5);
        make.top.equalTo(self.productTitleLab.mas_bottom).offset(10);
        
    }];
    
    [self.peopleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.productScount.mas_right).offset(10);
        make.bottom.equalTo(self.productScount).offset(-5);
        
    }];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = whiteColor();
    [self.bottomView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.bottomView).offset(5);
        make.right.equalTo(self.bottomView).offset(-5);
        make.height.mas_equalTo(1);
        make.top.equalTo(self.productScount.mas_bottom).offset(10);
        
    }];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.bottomView).offset(5);
        make.top.equalTo(line.mas_bottom).offset(20);
        make.height.lessThanOrEqualTo(@40);
        
    }];
    
    [self.summarizeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.mas_equalTo(20);
        make.centerY.equalTo(self.productScount);
        make.centerX.equalTo(line.mas_right).offset(-2);
        
    }];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.summarizeBtn.mas_left).offset(-15);
        make.centerY.width.height.equalTo(self.summarizeBtn);
        
    }];
    
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.shareBtn.mas_left).offset(-15);
        make.centerY.width.height.equalTo(self.shareBtn);
        
    }];
    
}

- (void)setShow{
    
    NSLog(@"%f",self.alpha);
    if (self.alpha > 0.6) {
        
        [self setLocationUI];
        
    }
}

#pragma mark---懒加载
- (UIImageView *)adImageV{
    
    if (!_adImageV) {
        _adImageV = [[UIImageView alloc]init];
        _adImageV.image = [UIImage imageNamed:@"Product_Normal"];
        _adImageV.contentMode = UIViewContentModeScaleAspectFit;
//        _adImageV.clipsToBounds = YES;
        [self.contentView addSubview:_adImageV];
        
        [_adImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.width.height.equalTo(self.contentView);
            
        }];
        
    }
    return _adImageV;
}

- (UIView *)bottomView{
    
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = UIColor.clearColor;
        
    }
    return _bottomView;
}

- (UILabel *)productTitleLab{
    
    if (!_productTitleLab) {
        _productTitleLab = [[UILabel alloc]init];
        _productTitleLab.text = @"iPhone S";
        _productTitleLab.textColor = whiteColor();
        _productTitleLab.font = Font26();
        
    }
    return _productTitleLab;
    
}

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
        _peopleLab.textColor = whiteColor();
        _peopleLab.font = Font14();
        
    }
    return _peopleLab;
}

- (UILabel *)contentLab{
    
    if (!_contentLab) {
        _contentLab = [[UILabel alloc]init];
        _contentLab.text = @"iPhone X是美国Apple（苹果公司）于北京时间2017年9月13日凌晨1点，在Apple Park新总部的史蒂夫·乔布斯剧院会上发布的新机型。其中X是罗马数字“10”的意思，代表着苹果向iPhone问世十周年致敬。";
        _contentLab.textColor = whiteColor();
        _contentLab.font = Font14();
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIButton *)summarizeBtn{
    
    if (!_summarizeBtn) {
        _summarizeBtn = [[UIButton alloc]init];
        [_summarizeBtn setImage:[UIImage imageNamed:@"概述"] forState:UIControlStateNormal];
        [_summarizeBtn setImage:[UIImage imageNamed:@"概述"] forState:UIControlStateHighlighted];
        
    }
    return _summarizeBtn;
}

- (UIButton *)shareBtn{
    
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc]init];
        [_shareBtn setImage:[UIImage imageNamed:@"ico_分享"] forState:UIControlStateNormal];
        [_shareBtn setImage:[UIImage imageNamed:@"ico_分享"] forState:UIControlStateHighlighted];
        
    }
    return _shareBtn;
}

- (UIButton *)collectionBtn{
    
    if (!_collectionBtn) {
        _collectionBtn = [[UIButton alloc]init];
        [_collectionBtn setImage:[UIImage imageNamed:@"概述"] forState:UIControlStateNormal];
        [_collectionBtn setImage:[UIImage imageNamed:@"概述"] forState:UIControlStateHighlighted];
        
    }
    return _collectionBtn;
}

#pragma mark---响应事件
- (void)startScroller{
    
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       
        self.bottomView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)endScroller{
    
//    if (self.alpha > 0.59) {
//
//        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//
//            self.bottomView.alpha = 1;
//
//        } completion:^(BOOL finished) {
//
//        }];
//
//    }
    
    if (self.width > (SCREEN_WIDTH) * 0.58) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self.bottomView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

///概述
- (void)summarizeAction{
    
    
}

///分享
- (void)shareAction{
    
    
}

///收藏
- (void)collectionAction{
    
    
}

@end
