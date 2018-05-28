//
//  SummarizeTopView.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/27.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "SummarizeTopView.h"

@implementation SummarizeTopView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        UILabel *titleLab = [[UILabel alloc]init];
        titleLab.text = @"简介";
        titleLab.font = Font16();
        titleLab.textColor = UIColor.blackColor;
        [self addSubview:titleLab];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(20);
            
        }];
        
        UILabel *contentLab = [[UILabel alloc]init];
        contentLab.numberOfLines = 0;
        contentLab.textColor = UIColor.grayColor;
        contentLab.text = @"按照官方的说法，十分深刻思念对方可是对方看是否能奥迪将发生了的罚款撒可富数据福克斯的疯狂拉升的交付女士阿萨德飞机阿克苏的饭卡上暗示法开始了疯狂拉升法规发发卡上发卡机开发康师傅咖啡理发卡了；付款";
        [self addSubview:contentLab];
        
        [contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(titleLab.mas_bottom).offset(20);
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(self).offset(10);
            
        }];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(20);
            
        }];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
