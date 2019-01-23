//
//  UINavigationController+HYTransitionAnimation.m
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2019/1/23.
//  Copyright © 2019 ocean. All rights reserved.
//

#import "UINavigationController+HYTransitionAnimation.h"
#import "HYTransitionAnimation.h"
#import <objc/runtime.h>
#import "UIViewController+HYTransitionAnimation.h"

@implementation UINavigationController (HYTransitionAnimation)

- (void)hy_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.delegate = self;
    [self pushViewController:viewController animated:animated];
}

- (void)hy_popViewControllerAnimated:(BOOL)animated {
    self.delegate = self;
    [self popViewControllerAnimated:animated];
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"navigationController: %@", navigationController);
    NSLog(@"operation: %@", @(operation));
    NSLog(@"fromVC: %@", fromVC);
    NSLog(@"toVC: %@", toVC);
    
    if (operation == UINavigationControllerOperationPush && toVC.pushAnimation) {
        return toVC.pushAnimation;
    } else if (operation == UINavigationControllerOperationPop && fromVC.popAnimation) {
        return fromVC.popAnimation;
    } else {
        return nil;
    }
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    NSLog(@"%s", __FUNCTION__);
    
    return nil;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"navigationController: %@", navigationController);
    NSLog(@"viewController: %@", viewController);
    NSLog(@"animated: %@", @(animated));
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"navigationController: %@", navigationController);
    NSLog(@"viewController: %@", viewController);
    NSLog(@"animated: %@", @(animated));
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    NSLog(@"%s", __FUNCTION__);
    
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController {
    NSLog(@"%s", __FUNCTION__);
    
    return UIInterfaceOrientationPortrait;
}

@end
