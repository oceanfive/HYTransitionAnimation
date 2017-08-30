//
//  HYPushTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYPushTransitionAnimation.h"

@implementation HYPushTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.type = HYTransitionAnimationTypePush;
    }
    return self;
}

@end
