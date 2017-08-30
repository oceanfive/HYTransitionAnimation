//
//  UIViewController+HYTransitionAnimationCategory.m
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/30.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "UIViewController+HYTransitionAnimationCategory.h"
#import <objc/runtime.h>
#import "HYTransitionAnimation.h"

static const char pushAnimationKey;
static const char popAnimationKey;

@implementation UIViewController (HYTransitionAnimationCategory)

#pragma mark - push
- (void)setPushAnimation:(HYTransitionAnimation *)pushAnimation{
    objc_setAssociatedObject(self, &pushAnimationKey, pushAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)pushAnimation{
    return objc_getAssociatedObject(self, &pushAnimationKey);
}

#pragma mark - pop
- (void)setPopAnimation:(HYTransitionAnimation *)popAnimation{
    objc_setAssociatedObject(self, &popAnimationKey, popAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HYTransitionAnimation *)popAnimation{
    return objc_getAssociatedObject(self, &popAnimationKey);
}

@end
