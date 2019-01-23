//
//  HYSystemTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYSystemTransitionAnimation.h"

@interface HYSystemTransitionAnimation ()<CAAnimationDelegate>

@end

@implementation HYSystemTransitionAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        self.direction = HYTransitionAnimationDirectionFromLeft;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super animateTransition:transitionContext];
    
    if (![self.fromVC.view isDescendantOfView:self.containerView]) {
        [self.containerView addSubview:self.fromVC.view];
    }
    if (![self.toVC.view isDescendantOfView:self.containerView]) {
        [self.containerView addSubview:self.toVC.view];
    }
    
    CATransition *anim = [CATransition animation];
    anim.delegate = self;
    anim.duration = [self transitionDuration:transitionContext];
    anim.type = [self hy_getAnimatonTypeWith:self.type];
    anim.subtype = [self hy_getDirectionWith:self.direction];
    [self.containerView.layer addAnimation:anim forKey:nil];
}


#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        if (self.isHiddenNavigationBar) {
            [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        }
    }
}


#pragma mark - private
- (NSString *)hy_getAnimatonTypeWith:(HYTransitionAnimationType)type {
    switch (type) {
        case HYTransitionAnimationTypeFade: return kCATransitionFade; break;
        case HYTransitionAnimationTypeMoveIn: return kCATransitionMoveIn; break;
        case HYTransitionAnimationTypePush: return kCATransitionPush; break;
        case HYTransitionAnimationTypeReveal: return kCATransitionReveal; break;
        case HYTransitionAnimationTypeCube: return @"cube"; break;
        case HYTransitionAnimationTypeSuckEffect: return @"suckEffect"; break;
        case HYTransitionAnimationTypeOglFlip: return @"oglFlip"; break;
        case HYTransitionAnimationTypeRippleEffect: return @"rippleEffect"; break;
        case HYTransitionAnimationTypePageCurl: return @"pageCurl"; break;
        case HYTransitionAnimationTypePageUnCurl: return @"pageUnCurl"; break;
        case HYTransitionAnimationTypeCameraIrisHollowOpen: return @"cameraIrisHollowOpen"; break;
        case HYTransitionAnimationTypeCameraIrisHollowClose: return @"cameraIrisHollowClose"; break;
        default:  break;
    }
}

- (NSString *)hy_getDirectionWith:(HYTransitionAnimationDirection)direction {
    switch (direction) {
        case HYTransitionAnimationDirectionFromLeft: return kCATransitionFromLeft; break;
        case HYTransitionAnimationDirectionFromRight: return kCATransitionFromRight; break;
        case HYTransitionAnimationDirectionFromTop: return kCATransitionFromBottom; break;
        case HYTransitionAnimationDirectionFromBottom: return kCATransitionFromTop; break;
        default: return kCATransitionFromLeft; break;
    }
}


@end
