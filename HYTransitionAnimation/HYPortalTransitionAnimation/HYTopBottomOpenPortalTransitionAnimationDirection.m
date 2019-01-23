//
//  HYTopBottomOpenPortalTransitionAnimationDirection.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYTopBottomOpenPortalTransitionAnimationDirection.h"

@implementation HYTopBottomOpenPortalTransitionAnimationDirection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operation = HYPortalTransitionAnimationOperationOpen;
        self.direction = HYPortalTransitionAnimationDirectionTopBottom;
    }
    return self;
}

@end
