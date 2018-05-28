//
//  ShowStartView.h
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/27.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowStartView : UIView

@end

@interface ShowScoreView : UIView

@property (nonatomic, strong) UILabel *startLab;
@property (nonatomic, strong) UILabel *amountLab;
@property (nonatomic, strong) UIView  *lineView;

@property (nonatomic, assign) float    count;

@end
