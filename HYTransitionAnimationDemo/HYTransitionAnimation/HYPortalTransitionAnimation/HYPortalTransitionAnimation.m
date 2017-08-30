//
//  HYPortalTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYPortalTransitionAnimation.h"

@implementation HYPortalTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.scale = 1.0;
        self.direction = HYPortalTransitionAnimationDirectionLeftRight;
        self.operation = HYPortalTransitionAnimationOperationOpen;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    [super animateTransition:transitionContext];
    if (self.operation == HYPortalTransitionAnimationOperationOpen) {
        [self openAnimation];
    } else if (self.operation == HYPortalTransitionAnimationOperationClose){
        [self closeAnimation];
    } else {
    
    }
}

//开门动画
- (void)openAnimation{
    //toView:获取目标控件的截图，用于缩放动画操作
    UIView *toViewSnapshot = [self.toView resizableSnapshotViewFromRect:self.toView.frame afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
    CATransform3D scale = CATransform3DIdentity;
    toViewSnapshot.layer.transform = CATransform3DScale(scale, self.scale, self.scale, 1);
    [self.containerView addSubview:toViewSnapshot];
    [self.containerView sendSubviewToBack:toViewSnapshot];
    
    //fromView:获取来源控件截图，用于开门位移动画操作；一分为二!
    //左半边
    CGRect leftSnapshotRegion = CGRectMake(0, 0, self.fromView.frame.size.width / 2, self.fromView.frame.size.height);
    UIView *leftHandView = [self.fromView resizableSnapshotViewFromRect:leftSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    leftHandView.frame = leftSnapshotRegion;

    //右半边
    CGRect rightSnapshotRegion = CGRectMake(self.fromView.frame.size.width / 2, 0, self.fromView.frame.size.width / 2, self.fromView.frame.size.height);
    UIView *rightHandView = [self.fromView resizableSnapshotViewFromRect:rightSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    rightHandView.frame = rightSnapshotRegion;

    //上半边
    CGRect topSnapshotRegion = CGRectMake(0, 0, self.fromView.frame.size.width, self.fromView.frame.size.height / 2);
    UIView *topHandView = [self.fromView resizableSnapshotViewFromRect:topSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    topHandView.frame = topSnapshotRegion;

    //下半边
    CGRect bottomSnapshotRegion = CGRectMake(0, self.fromView.frame.size.height / 2, self.fromView.frame.size.width, self.fromView.frame.size.height / 2);
    UIView *bottomHandView = [self.fromView resizableSnapshotViewFromRect:bottomSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    bottomHandView.frame = bottomSnapshotRegion;
    
    __weak typeof(self) wself = self;
    [UIView animateWithDuration:[self transitionDuration:self.transitionContext] animations:^{
        
        //fromView执行开门动画
        if (wself.direction == HYPortalTransitionAnimationDirectionLeftRight) {
            [wself.containerView addSubview:leftHandView];
            [wself.containerView addSubview:rightHandView];
            leftHandView.frame = CGRectOffset(leftHandView.frame, - leftHandView.frame.size.width, 0);
            rightHandView.frame = CGRectOffset(rightHandView.frame, rightHandView.frame.size.width, 0);
        } else if (wself.direction == HYPortalTransitionAnimationDirectionTopBottom){
            [wself.containerView addSubview:topHandView];
            [wself.containerView addSubview:bottomHandView];
            topHandView.frame = CGRectOffset(topHandView.frame, 0, -topHandView.frame.size.height);
            bottomHandView.frame = CGRectOffset(bottomHandView.frame, 0, bottomHandView.frame.size.height);
        } else {
        
        }

        //toView执行缩放动画
        toViewSnapshot.center = wself.toView.center;
        toViewSnapshot.frame = wself.toView.frame;
        
    } completion:^(BOOL finished) {
        
        //移除动画视图
        [toViewSnapshot removeFromSuperview];
        [leftHandView removeFromSuperview];
        [rightHandView removeFromSuperview];
        [topHandView removeFromSuperview];
        [bottomHandView removeFromSuperview];
        
        //转场动画完成
        [wself.transitionContext completeTransition:![wself.transitionContext transitionWasCancelled]];
        
    }];

}

//关门动画
- (void)closeAnimation{
    
    //TODO????
    CGRect toViewFinalFrame = [self.transitionContext finalFrameForViewController:self.toVC];
    self.toView.frame = toViewFinalFrame;
    self.toView.frame = CGRectOffset(self.toView.frame, self.toView.frame.size.width, 0);
    
    //左半边
    CGRect leftSnapshotRegion = CGRectMake(0, 0, self.toView.frame.size.width / 2, self.toView.frame.size.height);
    UIView *leftHandView = [self.toView resizableSnapshotViewFromRect:leftSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
    leftHandView.frame = leftSnapshotRegion;
    leftHandView.frame = CGRectOffset(leftHandView.frame, - leftHandView.frame.size.width, 0);
    
    //右半边
    CGRect rightSnapshotRegion = CGRectMake(self.toView.frame.size.width / 2, 0, self.toView.frame.size.width / 2, self.toView.frame.size.height);
    UIView *rightHandView = [self.toView resizableSnapshotViewFromRect:rightSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
    rightHandView.frame = rightSnapshotRegion;
    rightHandView.frame = CGRectOffset(rightHandView.frame, rightHandView.frame.size.width, 0);
    
    //上半边
    CGRect topSnapshotRegion = CGRectMake(0, 0, self.toView.frame.size.width, self.toView.frame.size.height / 2);
    UIView *topHandView = [self.toView resizableSnapshotViewFromRect:topSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
    topHandView.frame = topSnapshotRegion;
    topHandView.frame = CGRectOffset(topHandView.frame, 0, -topHandView.frame.size.height);
    
    //下半边
    CGRect bottomSnapshotRegion = CGRectMake(0, self.toView.frame.size.height / 2, self.toView.frame.size.width, self.toView.frame.size.height / 2);
    UIView *bottomHandView = [self.toView resizableSnapshotViewFromRect:bottomSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
    bottomHandView.frame = bottomSnapshotRegion;
    bottomHandView.frame = CGRectOffset(bottomHandView.frame, 0, bottomHandView.frame.size.height);
    
    __weak typeof(self) wself = self;
    [UIView animateWithDuration:[self transitionDuration:self.transitionContext] animations:^{
        
        //toView执行关门动画
        if (wself.direction == HYPortalTransitionAnimationDirectionLeftRight) {
            [wself.containerView addSubview:leftHandView];
            [wself.containerView addSubview:rightHandView];
            leftHandView.frame = CGRectOffset(leftHandView.frame, leftHandView.frame.size.width, 0);
            rightHandView.frame = CGRectOffset(rightHandView.frame, - rightHandView.frame.size.width, 0);
        } else if (wself.direction == HYPortalTransitionAnimationDirectionTopBottom){
            [wself.containerView addSubview:topHandView];
            [wself.containerView addSubview:bottomHandView];
            topHandView.frame = CGRectOffset(topHandView.frame, 0, topHandView.frame.size.height);
            bottomHandView.frame = CGRectOffset(bottomHandView.frame, 0, -bottomHandView.frame.size.height);
        } else {
            
        }

        //fromView执行缩放动画
        CATransform3D scale = CATransform3DIdentity;
        wself.fromView.layer.transform = CATransform3DScale(scale, wself.scale, wself.scale, 1);
        
    } completion:^(BOOL finished) {
        
        [wself.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        if ([wself.transitionContext transitionWasCancelled]) {
            [wself.containerView addSubview:wself.fromView];
        } else {
            [wself.containerView addSubview:wself.toView];
            wself.toView.frame = toViewFinalFrame;
        }
        [wself.transitionContext completeTransition:![wself.transitionContext transitionWasCancelled]];
        
    }];
    
}

@end
