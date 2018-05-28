//
//  Util.m
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "Util.h"

@implementation Util

///创建按钮
+ (UIButton *)buttonWithTitle:(NSString *)title WithFont:(UIFont *)font WihtImageName:(NSString *)imageName WithTextColor:(UIColor *)textColor{
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    return button;
    
}

///创建label
+ (UILabel *)labelWithTitle:(NSString *)title WithFont:(UIFont *)font WithTextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = textColor;
    label.text = title;
    label.font =font;
    return label;
    
}

+ (NSMutableAttributedString *)mutableStringWithTitle:(NSString *)titleStr WithString1:(NSString *)string1 WithString2:(NSString *)string2 WithAttrDic1:(NSDictionary *)dic1 WithAttrDic2:(NSDictionary *)dic2{
    
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:titleStr];
    NSRange range1=[[aString string]rangeOfString:string1];
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range1];
    [aString setAttributes:dic1 range:range1];
    NSRange range2=[[aString string]rangeOfString:string2];
    [aString setAttributes:dic2 range:range2];
    return aString;
    
}

@end
