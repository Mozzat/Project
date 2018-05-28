//
//  UITableView+NoData.m
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "UITableView+NoData.h"
#import <objc/runtime.h>

static char noDataViewKey;
@implementation UITableView (NoData)

- (void)showNodataView{
    
    NoDataView *nodataView = [[NoDataView alloc]initWithFrame:CGRectMake(0, BDTopHeight, SCREEN_WIDTH, SCREENH_HEIGHT - BDTopHeight - BDTabBarHeight) WithContent:@"没有数据"];
    [self.superview addSubview:nodataView];
    
}

- (void)hideNodataView{
    
    [self.nodataView removeFromSuperview];
    
}

- (NoDataView *)nodataView{
    
    return objc_getAssociatedObject(self, &noDataViewKey);
}

- (void)setNodataView:(NoDataView *)nodataView{
    
    objc_setAssociatedObject(self, &noDataViewKey, nodataView, OBJC_ASSOCIATION_RETAIN);
}

@end
