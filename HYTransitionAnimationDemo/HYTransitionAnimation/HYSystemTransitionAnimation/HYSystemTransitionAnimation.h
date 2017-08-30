//
//  HYSystemTransitionAnimation.h
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYTransitionAnimation.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HYTransitionAnimationType) {
    HYTransitionAnimationTypeFade = 1,  //淡出效果
    HYTransitionAnimationTypeMoveIn,    //新视图移动到旧视图上
    HYTransitionAnimationTypePush,      //新视图推出旧视图
    HYTransitionAnimationTypeReveal,    //移开旧视图显示新视图
    HYTransitionAnimationTypeCube,      //立方体翻转效果
    HYTransitionAnimationTypeSuckEffect,    //收缩效果 - direction无效
    HYTransitionAnimationTypeOglFlip,       //翻转效果
    HYTransitionAnimationTypeRippleEffect,  //水滴波纹效果 - direction无效
    HYTransitionAnimationTypePageCurl,      //向上翻页效果 - direction上下效果相同
    HYTransitionAnimationTypePageUnCurl,    //向下翻页效果 - direction上下效果相同
    HYTransitionAnimationTypeCameraIrisHollowOpen,  //摄像头打开效果 - direction无效
    HYTransitionAnimationTypeCameraIrisHollowClose, //摄像头关闭效果 - direction无效
};

typedef NS_ENUM(NSUInteger, HYTransitionAnimationDirection) {
    HYTransitionAnimationDirectionFromLeft = 1,
    HYTransitionAnimationDirectionFromRight,
    HYTransitionAnimationDirectionFromTop,
    HYTransitionAnimationDirectionFromBottom,
};

@interface HYSystemTransitionAnimation : HYTransitionAnimation

/**
 转场动画类型
 */
@property (nonatomic, assign) HYTransitionAnimationType type;

/**
 转场动画方向
 */
@property (nonatomic, assign) HYTransitionAnimationDirection direction;

@end

NS_ASSUME_NONNULL_END
