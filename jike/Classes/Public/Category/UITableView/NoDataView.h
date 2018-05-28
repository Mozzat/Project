//
//  NoDataView.h
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NoDataViewBlock)(void);
@interface NoDataView : UIView
- (instancetype)initWithFrame:(CGRect)frame WithContent:(NSString *)content;

@property (nonatomic, copy) NoDataViewBlock block;

@end
