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
static const char presentInteractiveTransitionKey;
static const char dismissInteractiveTransitionKey;
static const char pushInteractiveTransitionKey;
static const char popInteractiveTransitionKey;

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

#pragma mark - present interactive
- (void)setPresentInteractiveTransition:(UIPercentDrivenInteractiveTransition *)presentInteractiveTransition {
    objc_setAssociatedObject(self, &presentInteractiveTransitionKey, presentInteractiveTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPercentDrivenInteractiveTransition *)presentInteractiveTransition {
    return objc_getAssociatedObject(self, &presentInteractiveTransitionKey);
}

#pragma mark - dismiss interactive
- (void)setDismissInteractiveTransition:(UIPercentDrivenInteractiveTransition *)dismissInteractiveTransition {
    objc_setAssociatedObject(self, &dismissInteractiveTransitionKey, dismissInteractiveTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPercentDrivenInteractiveTransition *)dismissInteractiveTransition {
    return objc_getAssociatedObject(self, &dismissInteractiveTransitionKey);
}

#pragma mark - push interactive
- (void)setPushInteractiveTransition:(UIPercentDrivenInteractiveTransition *)pushInteractiveTransition {
    objc_setAssociatedObject(self, &pushInteractiveTransitionKey, pushInteractiveTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPercentDrivenInteractiveTransition *)pushInteractiveTransition {
    return objc_getAssociatedObject(self, &pushInteractiveTransitionKey);
}

#pragma mark - pop interactive
- (void)setPopInteractiveTransition:(UIPercentDrivenInteractiveTransition *)popInteractiveTransition {
    objc_setAssociatedObject(self, &popInteractiveTransitionKey, popInteractiveTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPercentDrivenInteractiveTransition *)popInteractiveTransition {
    return objc_getAssociatedObject(self, &popInteractiveTransitionKey);
}

#pragma mark - present/dismiss
- (void)hy_presentViewController:(UIViewController *)viewControllerToPresent
                        animated:(BOOL)flag
                      completion:(void (^ __nullable)(void))completion {
    viewControllerToPresent.transitioningDelegate = self;
    [self presentViewController:viewControllerToPresent animated:flag completion:^{
        if (completion) {
            completion();
        }
    }];
}

- (void)hy_dismissViewControllerAnimated:(BOOL)flag
                              completion:(void (^ __nullable)(void))completion {
    self.transitioningDelegate = self;
    [self dismissViewControllerAnimated:flag completion:^{
        if (completion) {
            completion();
        }
    }];
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
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"presented: %@", presented);
    NSLog(@"presenting: %@", presenting);
    NSLog(@"source: %@", source);
    NSLog(@"presented.presentAnimation: %@", presented.presentAnimation);
#endif
    
    if (presented.presentAnimation) {
        return presented.presentAnimation;
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"dismissed: %@", dismissed);
    NSLog(@"dismissed.dismissAnimation: %@", dismissed.dismissAnimation);
#endif
    
    if (dismissed.dismissAnimation) {
        return dismissed.dismissAnimation;
    }
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"animator: %@", animator);
    NSLog(@"self.presentInteractiveTransition: %@", self.presentInteractiveTransition);
#endif
    
    return self.presentInteractiveTransition;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"animator: %@", animator);
    NSLog(@"self.dismissInteractiveTransition: %@", self.dismissInteractiveTransition);
#endif
    
    return self.dismissInteractiveTransition;
}

//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0) {
//
//    NSLog(@"%s", __FUNCTION__);
//    NSLog(@"presented: %@", presented);
//    NSLog(@"presenting: %@", presenting);
//    NSLog(@"source: %@", source);
//
//    return nil;
//}

@end
