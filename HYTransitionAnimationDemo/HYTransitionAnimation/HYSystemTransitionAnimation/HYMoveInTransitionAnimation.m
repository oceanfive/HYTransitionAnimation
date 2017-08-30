//
//  HYMoveInTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYMoveInTransitionAnimation.h"

@implementation HYMoveInTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.type = HYTransitionAnimationTypeMoveIn;
    }
    return self;
}

@end
