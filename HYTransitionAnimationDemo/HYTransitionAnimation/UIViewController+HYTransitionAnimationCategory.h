//
//  UIViewController+HYTransitionAnimationCategory.h
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/30.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HYTransitionAnimation;

@interface UIViewController (HYTransitionAnimationCategory)

#pragma mark - 转场动画
/**
 push动画
 */
@property (nonatomic, strong) HYTransitionAnimation *pushAnimation;

/**
 pop动画
 */
@property (nonatomic, strong) HYTransitionAnimation *popAnimation;

@end

NS_ASSUME_NONNULL_END
