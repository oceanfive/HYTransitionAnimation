//
//  HYPortalTransitionAnimation.h
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYTransitionAnimation.h"

// 动画方向
typedef NS_ENUM(NSUInteger, HYPortalTransitionAnimationDirection) {
    HYPortalTransitionAnimationDirectionLeftRight,  //左右
    HYPortalTransitionAnimationDirectionTopBottom,  //上下
};

// 动画操作
typedef NS_ENUM(NSUInteger, HYPortalTransitionAnimationOperation) {
    HYPortalTransitionAnimationOperationOpen,   //开门
    HYPortalTransitionAnimationOperationClose,  //关门
};

@interface HYPortalTransitionAnimation : HYTransitionAnimation

/** 缩放系数，默认1.0 */
@property (nonatomic, assign) CGFloat scale;

/** 动画方向 */
@property (nonatomic, assign) HYPortalTransitionAnimationDirection direction;

/** 动画操作 */
@property (nonatomic, assign) HYPortalTransitionAnimationOperation operation;

@end
