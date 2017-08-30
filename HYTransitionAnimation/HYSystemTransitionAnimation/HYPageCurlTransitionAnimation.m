//
//  HYPageCurlTransitionAnimation.m
//  HYKit
//
//  Created by ocean on 2017/8/9.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYPageCurlTransitionAnimation.h"

@implementation HYPageCurlTransitionAnimation

- (instancetype)init{
    self = [super init];
    if (self) {
        self.type = HYTransitionAnimationTypePageCurl;
    }
    return self;
}

@end
