//
//  ProductView.h
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/22.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ProductViewBlock)(void);
@interface ProductView : UIView

@property (nonatomic, copy) ProductViewBlock block;

@end
