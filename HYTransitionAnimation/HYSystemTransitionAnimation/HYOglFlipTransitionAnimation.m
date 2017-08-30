//
//  HYOglFlipTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYOglFlipTransitionAnimation.h"

@implementation HYOglFlipTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.type = HYTransitionAnimationTypeOglFlip;
    }
    return self;
}

@end
