//
//  HYFadeTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/8.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYFadeTransitionAnimation.h"

@implementation HYFadeTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.type = HYTransitionAnimationTypeFade;
    }
    return self;
}

@end
