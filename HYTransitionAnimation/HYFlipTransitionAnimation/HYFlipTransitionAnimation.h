//
//  HYFlipTransitionAnimation.h
//  HYKit
//
//  Created by ocean on 2017/8/10.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYTransitionAnimation.h"

// 位置
typedef NS_ENUM(NSUInteger, HYFlipTransitionAnimationPositon) {
    /** 左边沿 */
    HYFlipTransitionAnimationPositonLeft,
    /** 右边沿 */
    HYFlipTransitionAnimationPositonRight,
    /** 上边沿 */
    HYFlipTransitionAnimationPositonTop,
    /** 下边沿 */
    HYFlipTransitionAnimationPositonBottom,
    /** 水平中间线 */
    HYFlipTransitionAnimationPositonHorizontalCenter,
    /** 竖直中间线 */
    HYFlipTransitionAnimationPositonVerticalCenter,
};

// 操作
typedef NS_ENUM(NSUInteger, HYFlipTransitionAnimationOperation) {
    /** 前进 */
    HYFlipTransitionAnimationOperationForward,
    /** 后退 */
    HYFlipTransitionAnimationOperationBack,
};

@interface HYFlipTransitionAnimation : HYTransitionAnimation

@property (nonatomic, assign) HYFlipTransitionAnimationOperation operation;

@property (nonatomic, assign) HYFlipTransitionAnimationPositon position;

@end
