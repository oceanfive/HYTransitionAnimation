//
//  HYTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYTransitionAnimation.h"

@interface HYTransitionAnimation ()

/// 记录初始状态的透明度
@property (nonatomic, assign) CGFloat alpha;
/// 记录初始状态的导航栏
@property (nonatomic, assign) BOOL hideNaviBar;

@end

@implementation HYTransitionAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        _duration = 0.6;
        _isHiddenNavigationBar = YES;
        _reversed = NO;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"%s", __FUNCTION__);
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"%s", __FUNCTION__);
    
    _transitionContext = transitionContext;
    _containerView = [transitionContext containerView];
    
    _fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    _fromView = _fromVC.view;
    _initialFrameForFromVC = [transitionContext initialFrameForViewController:_fromVC];
    _finalFrameForFromVC = [transitionContext finalFrameForViewController:_fromVC];
    
    _toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    _toView = _toVC.view;
    _initialFrameForToVC = [transitionContext initialFrameForViewController:_toVC];
    _finalFrameForToVC = [transitionContext finalFrameForViewController:_toVC];
    
    if (self.isHiddenNavigationBar) {
        self.alpha = self.fromVC.navigationController.navigationBar.alpha;
        self.hideNaviBar = self.fromVC.navigationController.navigationBarHidden;
        self.fromVC.navigationController.navigationBar.alpha = 0.0;
    }
//    if (![_fromVC.view isDescendantOfView:_containerView]) {
//        [_containerView addSubview:_fromVC.view];
//    }
//    if (![_toVC.view isDescendantOfView:_containerView]) {
//        [_containerView addSubview:_toVC.view];
//    }
    
    [self _logAllPropertiesValue];
}

// 转场结束 - completeTransition:方法触发
- (void)animationEnded:(BOOL)transitionCompleted {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"transitionCompleted: %@", @(transitionCompleted));
    if (self.isHiddenNavigationBar) {
        [UIView animateWithDuration:0.1 animations:^{
            self.toVC.navigationController.navigationBar.alpha = self.alpha;
            self.toVC.navigationController.navigationBarHidden = self.hideNaviBar;
        }];
    }
}

#pragma mark - Private

- (void)_logAllPropertiesValue {
    NSLog(@"transitionContext: %@", _transitionContext);
    
    NSLog(@"containerView: %@", _containerView);
    NSLog(@"animated: %@", @(_transitionContext.isAnimated));
    NSLog(@"isInteractive: %@", @(_transitionContext.isInteractive));
    NSLog(@"transitionWasCancelled: %@", @(_transitionContext.transitionWasCancelled));
    NSLog(@"presentationStyle: %@", @(_transitionContext.presentationStyle));
    
    NSLog(@"fromVC: %@", _fromVC);
    NSLog(@"toVC: %@", _toVC);
    
    NSLog(@"fromView: %@", _fromView);
    NSLog(@"toView: %@", _toView);
    
 
    NSLog(@"initialFrameFromVC: %@", NSStringFromCGRect(_initialFrameForFromVC));
    NSLog(@"finalFrameFromVC: %@", NSStringFromCGRect(_finalFrameForFromVC));
  
    NSLog(@"initialFrameToVC: %@", NSStringFromCGRect(_initialFrameForToVC));
    NSLog(@"finalFrameToVC: %@", NSStringFromCGRect(_finalFrameForToVC));
}

@end
