//
//  HYTransitionAnimation.h
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//  转场动画基类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*
 @discussion
 这个类是转场动画的基类，自定义转场动画需要继承这个类，并在子类中实现方法 - (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext; 在这个方法中执行具体的动画操作；动画完成完成后执行方法completeTransition:即可
 
 */

@interface HYTransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

/**
 转场动画持续时间
 */
@property (nonatomic, assign) NSTimeInterval duration;

/**
 转场动画期间是否隐藏导航栏，默认YES
 */
@property (nonatomic, assign) BOOL isHiddenNavigationBar;

/**
 转场动画发生的上下文
 */
@property (nonatomic, assign, readonly) id<UIViewControllerContextTransitioning>transitionContext;

/**
 转场动画的发生容器
 */
@property (nonatomic, strong, readonly) UIView *containerView;

/**
 转场动画的来源控制器
 */
@property (nonatomic, strong, readonly) UIViewController *fromVC;

/**
 转场动画的来源控制器视图
 */
@property (nonatomic, strong, readonly) UIView *fromView;

/**
 转场动画的目标控制器
 */
@property (nonatomic, strong, readonly) UIViewController *toVC;

/**
 转场动画的目标控制器视图
 */
@property (nonatomic, strong, readonly) UIView *toView;


@end

NS_ASSUME_NONNULL_END
