//
//  Util.h
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

///创建按钮
+ (UIButton *)buttonWithTitle:(NSString *)title WithFont:(UIFont *)font WihtImageName:(NSString *)imageName WithTextColor:(UIColor *)textColor;

///创建label
+ (UILabel *)labelWithTitle:(NSString *)title WithFont:(UIFont *)font WithTextColor:(UIColor *)textColor;


/**
 字符串富文本颜色

 @param titleStr 字符串
 @param string1 字符串1
 @param string2 字符串2
 @param dic1 样式1
 @param dic2 样式2
 @return 处理后的字符串
 */
+ (NSMutableAttributedString *)mutableStringWithTitle:(NSString *)titleStr WithString1:(NSString *)string1 WithString2:(NSString *)string2 WithAttrDic1:(NSDictionary *)dic1 WithAttrDic2:(NSDictionary *)dic2;

@end
