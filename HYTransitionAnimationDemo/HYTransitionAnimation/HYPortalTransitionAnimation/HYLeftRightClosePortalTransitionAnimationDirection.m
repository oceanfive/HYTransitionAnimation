//
//  HYLeftRightClosePortalTransitionAnimationDirection.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYLeftRightClosePortalTransitionAnimationDirection.h"

@implementation HYLeftRightClosePortalTransitionAnimationDirection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operation = HYPortalTransitionAnimationOperationClose;
        self.direction = HYPortalTransitionAnimationDirectionLeftRight;
    }
    return self;
}

@end
