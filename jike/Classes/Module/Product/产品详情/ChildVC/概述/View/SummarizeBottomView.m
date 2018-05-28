//
//  SummarizeBottomView.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/27.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "SummarizeBottomView.h"

@implementation SummarizeBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UILabel *label1 = [[UILabel alloc]init];
        label1.text = @"产品尺寸：661*239*164mm";
        label1.textColor = UIColor.lightGrayColor;
        label1.font = Font14();
        [self addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]init];
        label2.text = @"颜色：黑白";
        label2.textColor = UIColor.lightGrayColor;
        label2.font = Font14();
//        label2.textAlignment = NSTextAlignmentRight;
        [self addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc]init];
        label3.text = @"产品重量：4.25kg";
        label3.textColor = UIColor.lightGrayColor;
        label3.font = Font14();
        [self addSubview:label3];
        
        UILabel *label4 = [[UILabel alloc]init];
        label4.text = @"产品重量：4.25kg";
        label4.textColor = UIColor.lightGrayColor;
        label4.font = Font14();
//        label4.textAlignment = NSTextAlignmentRight;
        [self addSubview:label4];
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(20);
            make.left.equalTo(self).offset(20);
            make.width.mas_equalTo(SCREEN_WIDTH/2.0 - 20);
            make.height.mas_equalTo(25);
            
        }];
        
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(20);
            make.left.equalTo(label1.mas_right).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(25);
            
        }];
        
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(label1.mas_bottom).offset(10);
            make.left.equalTo(self).offset(20);
            make.width.mas_equalTo(SCREEN_WIDTH/2.0 - 20);
            make.height.mas_equalTo(25);
            
        }];
        
        [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(label2.mas_bottom).offset(10);
            make.left.equalTo(label1.mas_right).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(25);
            
        }];
        
    }
    return self;
}

@end
