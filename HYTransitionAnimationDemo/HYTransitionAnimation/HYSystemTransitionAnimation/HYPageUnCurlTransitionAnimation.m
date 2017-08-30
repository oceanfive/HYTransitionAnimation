//
//  HYPageUnCurlTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYPageUnCurlTransitionAnimation.h"

@implementation HYPageUnCurlTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.type = HYTransitionAnimationTypePageUnCurl;
    }
    return self;
}

@end
