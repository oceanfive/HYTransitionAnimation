//
//  UIViewController+HYTransitionAnimationCategory.h
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/30.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HYTransitionAnimation;

@interface UIViewController (HYTransitionAnimationCategory)<UIViewControllerTransitioningDelegate>

#pragma mark - 转场动画
/**
 push动画
 */
@property (nonatomic, strong) HYTransitionAnimation *pushAnimation;

/**
 pop动画
 */
@property (nonatomic, strong) HYTransitionAnimation *popAnimation;

/**
 present动画
 */
@property (nonatomic, strong) HYTransitionAnimation *presentAnimation;

/**
 dismiss动画
 */
@property (nonatomic, strong) HYTransitionAnimation *dismissAnimation;

#pragma mark - present/dismiss 转场

/**
 present

 @param viewControllerToPresent 目标控制器
 @param animation 动画,nil的话表示使用系统默认的
 */
- (void)hy_presentViewController:(UIViewController *)viewControllerToPresent animation:(nullable HYTransitionAnimation *)animation;;

/**
 dismiss

 @param animation 动画,nil的话表示使用系统默认的
 */
- (void)hy_dismissViewControllerAnimation:(nullable HYTransitionAnimation *)animation;

@end

NS_ASSUME_NONNULL_END
