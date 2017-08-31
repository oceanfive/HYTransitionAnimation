//
//  UIViewController+HYTransitionAnimationCategory.m
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/30.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "UIViewController+HYTransitionAnimationCategory.h"
#import <objc/runtime.h>
#import "HYTransitionAnimation.h"

static const char pushAnimationKey;
static const char popAnimationKey;
static const char presentAnimationKey;
static const char dismissAnimationKey;

@implementation UIViewController (HYTransitionAnimationCategory)

#pragma mark - push
- (void)setPushAnimation:(HYTransitionAnimation *)pushAnimation{
    objc_setAssociatedObject(self, &pushAnimationKey, pushAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)pushAnimation{
    return objc_getAssociatedObject(self, &pushAnimationKey);
}

#pragma mark - pop
- (void)setPopAnimation:(HYTransitionAnimation *)popAnimation{
    objc_setAssociatedObject(self, &popAnimationKey, popAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)popAnimation{
    return objc_getAssociatedObject(self, &popAnimationKey);
}

#pragma mark - present
- (void)setPresentAnimation:(HYTransitionAnimation *)presentAnimation{
    objc_setAssociatedObject(self, &presentAnimationKey, presentAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)presentAnimation{
    return objc_getAssociatedObject(self, &presentAnimationKey);
}

#pragma mark - dismiss
- (void)setDismissAnimation:(HYTransitionAnimation *)dismissAnimation{
    objc_setAssociatedObject(self, &dismissAnimationKey, dismissAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)dismissAnimation{
    return objc_getAssociatedObject(self, &dismissAnimationKey);
}


#pragma mark - present/dismiss
- (void)hy_presentViewController:(UIViewController *)viewControllerToPresent animation:(HYTransitionAnimation *)animation{
    viewControllerToPresent.transitioningDelegate = self;
    viewControllerToPresent.presentAnimation = animation;
    [self presentViewController:viewControllerToPresent animated:YES completion:nil];
}

- (void)hy_dismissViewControllerAnimation:(HYTransitionAnimation *)animation{
    self.transitioningDelegate = self;
    self.dismissAnimation = animation;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
/**
 presen转场代理
 [self presentViewController:viewControllerToPresent animated:YES completion:nil];
 
 @param presented 目标控制器，需要present的控制器吗，就是viewControllerToPresent
 @param presenting 正在转场的控制器，如UINavigationController
 @param source 源控制器，self
 @return present转场动画
 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    if (presented.presentAnimation) {
        return presented.presentAnimation;
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    if (dismissed.dismissAnimation) {
        return dismissed.dismissAnimation;
    }
    return nil;
}

@end
