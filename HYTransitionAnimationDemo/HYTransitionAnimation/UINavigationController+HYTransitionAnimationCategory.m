//
//  UINavigationController+HYTransitionAnimationCategory.m
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/30.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "UINavigationController+HYTransitionAnimationCategory.h"
#import "HYTransitionAnimation.h"
#import <objc/runtime.h>
#import "UIViewController+HYTransitionAnimationCategory.h"

@implementation UINavigationController (HYTransitionAnimationCategory)

- (void)hy_pushViewController:(UIViewController *)viewController animation:(HYTransitionAnimation *)animation{
    self.delegate = self;
    viewController.pushAnimation = animation;
    [self pushViewController:viewController animated:YES];
}

- (void)hy_popViewControllerAnimation:(HYTransitionAnimation *)animation{
    self.delegate = self;
    UIViewController *vc = [self.viewControllers lastObject];
    vc.popAnimation = animation;
    [self popViewControllerAnimated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush && toVC.pushAnimation) {
        return toVC.pushAnimation;
    } else if (operation == UINavigationControllerOperationPop && fromVC.popAnimation) {
        return fromVC.popAnimation;
    } else {
        return nil;
    }
}

//- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
//
//}

@end
