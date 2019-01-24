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

static const char hyInteractiveTransitionKey;

@interface UINavigationController ()

/** push/pop 对应的交互式转场动画 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition * hy_interactiveTransition;

@end

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
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"navigationController: %@", navigationController);
    NSLog(@"operation: %@", @(operation));
    NSLog(@"fromVC: %@", fromVC);
    NSLog(@"toVC: %@", toVC);
#endif
    
    // 在这里记录最后一个控制器的 InteractiveTransition，因为在下面的代理方法中获取不到 fromVC 和 toVC
    if (operation == UINavigationControllerOperationPush && toVC.pushAnimation) {
#ifdef DEBUG
        NSLog(@"UINavigationControllerOperationPush --------");
        NSLog(@"toVC.pushAnimation: %@", toVC.pushAnimation);
        NSLog(@"toVC.pushInteractiveTransition: %@", toVC.pushInteractiveTransition);
#endif
        self.hy_interactiveTransition = toVC.pushInteractiveTransition;
        return toVC.pushAnimation;
    } else if (operation == UINavigationControllerOperationPop && fromVC.popAnimation) {
#ifdef DEBUG
        NSLog(@"UINavigationControllerOperationPop --------");
        NSLog(@"fromVC.popAnimation: %@", fromVC.popAnimation);
        NSLog(@"fromVC.popInteractiveTransition: %@", fromVC.popInteractiveTransition);
#endif
        self.hy_interactiveTransition = fromVC.popInteractiveTransition;
        return fromVC.popAnimation;
    } else {
#ifdef DEBUG
        NSLog(@"UINavigationControllerOperationNone --------");
#endif
        return nil;
    }
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"navigationController: %@", navigationController);
    NSLog(@"animationController: %@", animationController);
    NSLog(@"hy_interactiveTransition: %@", self.hy_interactiveTransition);
#endif
    return self.hy_interactiveTransition;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"navigationController: %@", navigationController);
    NSLog(@"viewController: %@", viewController);
    NSLog(@"animated: %@", @(animated));
#endif
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"navigationController: %@", navigationController);
    NSLog(@"viewController: %@", viewController);
    NSLog(@"animated: %@", @(animated));
#endif
}

//- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
//    NSLog(@"%s", __FUNCTION__);
//
//    return UIInterfaceOrientationMaskAllButUpsideDown;
//}
//
//- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController {
//    NSLog(@"%s", __FUNCTION__);
//
//    return UIInterfaceOrientationPortrait;
//}

#pragma mark - setter & getter

- (void)setHy_interactiveTransition:(UIPercentDrivenInteractiveTransition *)hy_interactiveTransition {
    objc_setAssociatedObject(self, &hyInteractiveTransitionKey, hy_interactiveTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPercentDrivenInteractiveTransition *)hy_interactiveTransition {
    return objc_getAssociatedObject(self, &hyInteractiveTransitionKey);
}

@end
