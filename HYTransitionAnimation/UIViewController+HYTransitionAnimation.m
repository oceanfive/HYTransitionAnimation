//
//  UIViewController+HYTransitionAnimation.m
//  StudyToday
//
//  Created by ocean on 2019/1/22.
//  Copyright © 2019 ocean. All rights reserved.
//

#import "UIViewController+HYTransitionAnimation.h"
#import <objc/runtime.h>
#import "HYTransitionAnimation.h"

static const char pushAnimationKey;
static const char popAnimationKey;
static const char presentAnimationKey;
static const char dismissAnimationKey;

@implementation UIViewController (HYTransitionAnimation)

#pragma mark - push
- (void)setPushAnimation:(HYTransitionAnimation *)pushAnimation {
    objc_setAssociatedObject(self, &pushAnimationKey, pushAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)pushAnimation {
    return objc_getAssociatedObject(self, &pushAnimationKey);
}

#pragma mark - pop
- (void)setPopAnimation:(HYTransitionAnimation *)popAnimation {
    objc_setAssociatedObject(self, &popAnimationKey, popAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)popAnimation {
    return objc_getAssociatedObject(self, &popAnimationKey);
}

#pragma mark - present
- (void)setPresentAnimation:(HYTransitionAnimation *)presentAnimation {
    objc_setAssociatedObject(self, &presentAnimationKey, presentAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)presentAnimation {
    return objc_getAssociatedObject(self, &presentAnimationKey);
}

#pragma mark - dismiss
- (void)setDismissAnimation:(HYTransitionAnimation *)dismissAnimation {
    objc_setAssociatedObject(self, &dismissAnimationKey, dismissAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)dismissAnimation {
    return objc_getAssociatedObject(self, &dismissAnimationKey);
}


#pragma mark - present/dismiss
- (void)hy_presentViewController:(UIViewController *)viewControllerToPresent
                        animated:(BOOL)flag
                      completion:(void (^ __nullable)(void))completion {
    viewControllerToPresent.transitioningDelegate = self;
    [self presentViewController:viewControllerToPresent animated:YES completion:completion];
}

- (void)hy_dismissViewControllerAnimated:(BOOL)flag
                              completion:(void (^ __nullable)(void))completion {
    self.transitioningDelegate = self;
    [self dismissViewControllerAnimated:YES completion:completion];
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
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"presented: %@", presented);
    NSLog(@"presenting: %@", presenting);
    NSLog(@"source: %@", source);
    
    if (presented.presentAnimation) {
        return presented.presentAnimation;
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"dismissed: %@", dismissed);
    
    if (dismissed.dismissAnimation) {
        return dismissed.dismissAnimation;
    }
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"animator: %@", animator);
    
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"animator: %@", animator);
    
    return nil;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0) {
    
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"presented: %@", presented);
    NSLog(@"presenting: %@", presenting);
    NSLog(@"source: %@", source);
    
    return nil;
}

@end
