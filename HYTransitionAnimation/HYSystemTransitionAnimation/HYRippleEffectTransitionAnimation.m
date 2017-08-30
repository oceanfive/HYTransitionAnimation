//
//  HYRippleEffectTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYRippleEffectTransitionAnimation.h"

@implementation HYRippleEffectTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.type = HYTransitionAnimationTypeRippleEffect;
    }
    return self;
}

@end
