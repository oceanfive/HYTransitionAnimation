//
//  HYTopBottomClosePortalTransitionAnimationDirection.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYTopBottomClosePortalTransitionAnimationDirection.h"

@implementation HYTopBottomClosePortalTransitionAnimationDirection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operation = HYPortalTransitionAnimationOperationClose;
        self.direction = HYPortalTransitionAnimationDirectionTopBottom;
    }
    return self;
}

@end
