//
//  AppDelegate+UMeng.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/22.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "AppDelegate+UMeng.h"
#import <UMCommon/UMCommon.h>

@implementation AppDelegate (UMeng)

- (void)registUmengKey:(NSString *)appKey{
    
    [UMConfigure initWithAppkey:appKey channel:nil];
    
}

@end
