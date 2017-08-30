//
//  HYFlipTransitionAnimation.h
//  HYKit
//
//  Created by ocean on 2017/8/10.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYTransitionAnimation.h"

//位置
typedef NS_ENUM(NSUInteger, HYFlipTransitionAnimationPositon) {
    HYFlipTransitionAnimationPositonLeft,   //左边沿
    HYFlipTransitionAnimationPositonRight,  //右边沿
    HYFlipTransitionAnimationPositonTop,    //上边沿
    HYFlipTransitionAnimationPositonBottom, //下边沿
    HYFlipTransitionAnimationPositonHorizontalCenter,   //水平中间线
    HYFlipTransitionAnimationPositonVerticalCenter, //竖直中间线
};

//操作
typedef NS_ENUM(NSUInteger, HYFlipTransitionAnimationOperation) {
    HYFlipTransitionAnimationOperationForward,  //前进
    HYFlipTransitionAnimationOperationBack, //后退
};

@interface HYFlipTransitionAnimation : HYTransitionAnimation

@property (nonatomic, assign) HYFlipTransitionAnimationOperation operation;

@property (nonatomic, assign) HYFlipTransitionAnimationPositon position;

@end
