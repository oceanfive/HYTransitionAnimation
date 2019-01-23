//
//  HYFlipTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/10.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYFlipTransitionAnimation.h"

@implementation HYFlipTransitionAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super animateTransition:transitionContext];
    
    if (self.operation == HYFlipTransitionAnimationOperationForward) {
        [self forwardOperation];
    } else if (self.operation == HYFlipTransitionAnimationOperationBack){
        [self backOperation];
    } else {
    
    }
}

//前进
- (void)forwardOperation {
    switch (self.position) {
        case HYFlipTransitionAnimationPositonLeft:
        case HYFlipTransitionAnimationPositonRight:
        case HYFlipTransitionAnimationPositonTop:
        case HYFlipTransitionAnimationPositonBottom: {
        
            UIView *fromViewSnapshot = [self.fromView snapshotViewAfterScreenUpdates:NO];
            fromViewSnapshot.frame = self.fromView.frame;
            [self.containerView addSubview:fromViewSnapshot];
            
            self.fromView.hidden = YES;
            //获取锚点
            CGPoint anchiorPoint = [self getAnchorPoint];
            //设置锚点之后view位置发生变化，需要重新设置到原点(0,0)
            CGFloat offsetX = (anchiorPoint.x - fromViewSnapshot.layer.anchorPoint.x) * fromViewSnapshot.frame.size.width;
            CGFloat offsetY = (anchiorPoint.y - fromViewSnapshot.layer.anchorPoint.y) * fromViewSnapshot.frame.size.height;
            fromViewSnapshot.frame = CGRectOffset(fromViewSnapshot.frame, offsetX, offsetY);
            //设置锚点
            fromViewSnapshot.layer.anchorPoint = anchiorPoint;
            //设置
            CATransform3D transfrom3d = CATransform3DIdentity;
            transfrom3d.m34 = -1/500.0;
            self.containerView.layer.sublayerTransform = transfrom3d;
            
            __weak typeof(self) wself = self;
            [UIView animateWithDuration:[self transitionDuration:self.transitionContext] animations:^{
                
                fromViewSnapshot.layer.transform = [wself getCATransform3D];
                
            } completion:^(BOOL finished) {
                
                [fromViewSnapshot removeFromSuperview];
                self.fromView.hidden = NO;
                
                [wself.transitionContext completeTransition:![wself.transitionContext transitionWasCancelled]];
            }];
            
        } break;
            
        case HYFlipTransitionAnimationPositonVerticalCenter: {
        
            //fromView
            //左半边
            CGRect fromLeftSnapshotRegion = CGRectMake(0, 0, self.fromView.frame.size.width / 2, self.fromView.frame.size.height);
            UIView *fromLeftHandView = [self.fromView resizableSnapshotViewFromRect:fromLeftSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            fromLeftHandView.frame = fromLeftSnapshotRegion;
            
            //右半边
            CGRect fromRightSnapshotRegion = CGRectMake(self.fromView.frame.size.width / 2, 0, self.fromView.frame.size.width / 2, self.fromView.frame.size.height);
            UIView *fromRightHandView = [self.fromView resizableSnapshotViewFromRect:fromRightSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            fromRightHandView.frame = fromRightSnapshotRegion;
            
            //上半边
            CGRect fromTopSnapshotRegion = CGRectMake(0, 0, self.fromView.frame.size.width, self.fromView.frame.size.height / 2);
            UIView *fromTopHandView = [self.fromView resizableSnapshotViewFromRect:fromTopSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            fromTopHandView.frame = fromTopSnapshotRegion;
            
            //下半边
            CGRect fromBottomSnapshotRegion = CGRectMake(0, self.fromView.frame.size.height / 2, self.fromView.frame.size.width, self.fromView.frame.size.height / 2);
            UIView *fromBottomHandView = [self.fromView resizableSnapshotViewFromRect:fromBottomSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            fromBottomHandView.frame = fromBottomSnapshotRegion;
            
            
            //toView
            //左半边
            CGRect toLeftSnapshotRegion = CGRectMake(0, 0, self.toView.frame.size.width / 2, self.toView.frame.size.height);
            UIView *toLeftHandView = [self.toView resizableSnapshotViewFromRect:toLeftSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
            toLeftHandView.frame = toLeftSnapshotRegion;
            
            //右半边
            CGRect toRightSnapshotRegion = CGRectMake(self.toView.frame.size.width / 2, 0, self.toView.frame.size.width / 2, self.toView.frame.size.height);
            UIView *toRightHandView = [self.toView resizableSnapshotViewFromRect:toRightSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
            toRightHandView.frame = toRightSnapshotRegion;
            
            //上半边
            CGRect toTopSnapshotRegion = CGRectMake(0, 0, self.toView.frame.size.width, self.toView.frame.size.height / 2);
            UIView *toTopHandView = [self.toView resizableSnapshotViewFromRect:toTopSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
            toTopHandView.frame = toTopSnapshotRegion;
            
            //下半边
            CGRect toBottomSnapshotRegion = CGRectMake(0, self.toView.frame.size.height / 2, self.toView.frame.size.width, self.toView.frame.size.height / 2);
            UIView *toBottomHandView = [self.toView resizableSnapshotViewFromRect:toBottomSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
            toBottomHandView.frame = toBottomSnapshotRegion;
            
            
            self.fromView.hidden = YES;
            
//            [self.containerView addSubview:fromLeftHandView];
//            [self handleView:fromLeftHandView anchorPoint:CGPointMake(1, 0.5)];
            
            [self.containerView addSubview:toRightHandView];
            [self handleView:toRightHandView anchorPoint:CGPointMake(1, 0.5)];
//            toRightHandView.layer.transform = CATransform3DMakeRotation(-M_PI, 0, 1, 0);
            
//            UIView *fromViewSnapshot = [self.fromView snapshotViewAfterScreenUpdates:NO];
//            fromViewSnapshot.frame = self.fromView.frame;
//            [self.containerView addSubview:fromViewSnapshot];
//            
//            self.fromView.hidden = YES;
//            //获取锚点
//            CGPoint anchiorPoint = [self getAnchorPoint];
//            //设置锚点之后view位置发生变化，需要重新设置到原点(0,0)
//            CGFloat offsetX = (anchiorPoint.x - fromViewSnapshot.layer.anchorPoint.x) * fromViewSnapshot.frame.size.width;
//            CGFloat offsetY = (anchiorPoint.y - fromViewSnapshot.layer.anchorPoint.y) * fromViewSnapshot.frame.size.height;
//            fromViewSnapshot.frame = CGRectOffset(fromViewSnapshot.frame, offsetX, offsetY);
//            //设置锚点
//            fromViewSnapshot.layer.anchorPoint = anchiorPoint;
//            //设置
            CATransform3D transfrom3d = CATransform3DIdentity;
            transfrom3d.m34 = -1/500.0;
            self.containerView.layer.sublayerTransform = transfrom3d;
            
            __weak typeof(self) wself = self;
            [UIView animateWithDuration:[self transitionDuration:self.transitionContext] animations:^{
                
                fromLeftHandView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
                toRightHandView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
                
//                fromViewSnapshot.layer.transform = [wself getCATransform3D];
                
            } completion:^(BOOL finished) {
                
                [fromLeftHandView removeFromSuperview];
                [toRightHandView removeFromSuperview];
                self.fromView.hidden = NO;
                
                [wself.transitionContext completeTransition:![wself.transitionContext transitionWasCancelled]];
            }];
            
        } break;
            
        case HYFlipTransitionAnimationPositonHorizontalCenter: {
        
        } break;
            
        default: {
        
        } break;
    }
    
    

}

//后退
- (void)backOperation{


}

//根据position获取锚点获取锚点
- (CGPoint)getAnchorPoint{
    CGPoint anchiorPoint;
    switch (self.position) {
        case HYFlipTransitionAnimationPositonLeft: { anchiorPoint = CGPointMake(0, 0.5); } break;
        case HYFlipTransitionAnimationPositonRight: { anchiorPoint = CGPointMake(1, 0.5); } break;
        case HYFlipTransitionAnimationPositonTop: { anchiorPoint = CGPointMake(0.5, 0); } break;
        case HYFlipTransitionAnimationPositonBottom: { anchiorPoint = CGPointMake(0.5, 1); } break;
        case HYFlipTransitionAnimationPositonVerticalCenter: { anchiorPoint = CGPointMake(0.5, 0.5); } break;
        case HYFlipTransitionAnimationPositonHorizontalCenter: { anchiorPoint = CGPointMake(0.5, 0.5); } break;
        default: { CGPointMake(0.5, 0.5); } break;
    }
    return anchiorPoint;
}

//根据position获取矩阵变化
- (CATransform3D)getCATransform3D{
    CATransform3D transform3D;
    CGFloat angle = M_PI_2;
    switch (self.position) {
        case HYFlipTransitionAnimationPositonLeft: {
            transform3D = CATransform3DMakeRotation(-angle, 0, 1, 0);
        } break;
            
        case HYFlipTransitionAnimationPositonRight: {
            transform3D = CATransform3DMakeRotation(angle, 0, 1, 0);
        } break;
            
        case HYFlipTransitionAnimationPositonTop: {
            transform3D = CATransform3DMakeRotation(angle, 1, 0, 0);
        } break;
            
        case HYFlipTransitionAnimationPositonBottom: {
            transform3D = CATransform3DMakeRotation(-angle, 1, 0, 0);
        } break;
            
        case HYFlipTransitionAnimationPositonVerticalCenter: {
            transform3D = CATransform3DMakeRotation(-angle, 1, 0, 0);
        } break;
            
        case HYFlipTransitionAnimationPositonHorizontalCenter: {
            transform3D = CATransform3DMakeRotation(-angle, 0, 1, 0);
        } break;
            
        default: {  } break;
    }
    return transform3D;
}

//处理锚点改变的view
- (void)handleView:(UIView *)view anchorPoint:(CGPoint)anchorPoint{
    //设置锚点之后view位置发生变化，需要重新设置到原点(0,0)
    CGFloat offsetX = (anchorPoint.x - view.layer.anchorPoint.x) * view.frame.size.width;
    CGFloat offsetY = (anchorPoint.y - view.layer.anchorPoint.y) * view.frame.size.height;
    view.frame = CGRectOffset(view.frame, offsetX, offsetY);
    //设置锚点
    view.layer.anchorPoint = anchorPoint;
}

@end
