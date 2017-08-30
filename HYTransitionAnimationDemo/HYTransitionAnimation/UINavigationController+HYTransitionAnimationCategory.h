//
//  UINavigationController+HYTransitionAnimationCategory.h
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/30.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HYTransitionAnimation;

@interface UINavigationController (HYTransitionAnimationCategory)<UINavigationControllerDelegate>

/**
 带有转场动画效果的push操作
 
 @param viewController 目标控制器
 @param animation 动画效果，nil的话表示使用系统默认的
 */
- (void)hy_pushViewController:(UIViewController *)viewController animation:(nullable HYTransitionAnimation *)animation;

/**
 带有转场动画效果的pop操作
 
 @param animation 动画效果，nil的话表示使用系统默认的
 */
- (void)hy_popViewControllerAnimation:(nullable HYTransitionAnimation *)animation;

@end

NS_ASSUME_NONNULL_END
