//
//  ChildProductVC.h
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/24.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger , ChildProductType) {
    
    ChildProductTypeNow = 0,
    ChildProductTypeAI,
    ChildProductTypeWear,
    ChildProductTypePhone,
    ChildProductTypeMovie,
    ChildProductTypeFurniture,
    ChildProductTypePhoto,
    ChildProductTypeTideProduct,
    ChildProductTypehealthy,
    
};
@interface ChildProductVC : BaseViewController

- (instancetype)initWithChildProductType:(ChildProductType)type;

@end
