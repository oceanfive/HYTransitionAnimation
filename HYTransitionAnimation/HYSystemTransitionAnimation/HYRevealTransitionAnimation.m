//
//  HYRevealTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYRevealTransitionAnimation.h"

@implementation HYRevealTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.type = HYTransitionAnimationTypeReveal;
    }
    return self;
}

@end
