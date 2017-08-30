//
//  HYTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYTransitionAnimation.h"

@interface HYTransitionAnimation ()

@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, assign) BOOL hideNaviBar;

@end

@implementation HYTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.duration = 0.6;
        self.isHiddenNavigationBar = YES;
    }
    return self;
}

//转场时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return self.duration;
}

//转场操作
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    _transitionContext = transitionContext;
    _containerView = [transitionContext containerView];
    _fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    _toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    _fromView = _fromVC.view;
    _toView = _toVC.view;
    if (self.isHiddenNavigationBar) {
        self.alpha = self.fromVC.navigationController.navigationBar.alpha;
        self.hideNaviBar = self.fromVC.navigationController.navigationBarHidden;
        self.fromVC.navigationController.navigationBar.alpha = 0.0;
    }
    if (![_fromVC.view isDescendantOfView:_containerView]) {
        [_containerView addSubview:_fromVC.view];
    }
    if (![_toVC.view isDescendantOfView:_containerView]) {
        [_containerView addSubview:_toVC.view];
    }
}

//转场结束 - completeTransition:方法触发
- (void)animationEnded:(BOOL)transitionCompleted{
    if (self.isHiddenNavigationBar) {
        __weak typeof(self) wself = self;
        [UIView animateWithDuration:0.1 animations:^{
            wself.toVC.navigationController.navigationBar.alpha = self.alpha;
            wself.toVC.navigationController.navigationBarHidden = self.hideNaviBar;
        }];
    }
}

@end
