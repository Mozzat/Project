//
//  TransitionAnimationManager.h
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/22.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureConifg)(void);

typedef NS_ENUM(NSUInteger , TransitionGestureDirection) { ///手势的方向
    
    TransitionGestureDirectionLeft = 0,
    TransitionGestureDirectionRight,
    TransitionGestureDirectionUp,
    TransitionGestureDirectionDown
    
};

typedef NS_ENUM(NSUInteger, InteractiveTransitionType) {//手势控制哪种转场
    InteractiveTransitionTypePresent = 0,
    InteractiveTransitionTypeDismiss,
    InteractiveTransitionTypePush,
    InteractiveTransitionTypePop,
};

@interface TransitionAnimationManager : UIPercentDrivenInteractiveTransition

/**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
@property (nonatomic, assign) BOOL interation;
/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg presentConifg;
/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg pushConifg;

///初始化方法
+ (instancetype)interactiveTransitionWithTransitionType:(InteractiveTransitionType)type GestureDirection:(TransitionGestureDirection)direction;
- (instancetype)initWithTransitionType:(InteractiveTransitionType)type GestureDirection:(TransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end
