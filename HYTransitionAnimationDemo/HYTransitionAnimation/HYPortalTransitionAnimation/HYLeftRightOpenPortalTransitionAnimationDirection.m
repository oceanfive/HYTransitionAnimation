//
//  HYLeftRightOpenPortalTransitionAnimationDirection.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYLeftRightOpenPortalTransitionAnimationDirection.h"

@implementation HYLeftRightOpenPortalTransitionAnimationDirection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operation = HYPortalTransitionAnimationOperationOpen;
        self.direction = HYPortalTransitionAnimationDirectionLeftRight;
    }
    return self;
}

@end
