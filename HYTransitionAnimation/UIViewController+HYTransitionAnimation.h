//
//  UIViewController+HYTransitionAnimation.h
//  StudyToday
//
//  Created by ocean on 2019/1/22.
//  Copyright © 2019 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYTransitionAnimation;

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HYTransitionAnimation)<UIViewControllerTransitioningDelegate>

#pragma mark - 转场动画
/** push动画 */
@property (nonatomic, strong) HYTransitionAnimation *pushAnimation;
/** pop动画 */
@property (nonatomic, strong) HYTransitionAnimation *popAnimation;
/** present动画 */
@property (nonatomic, strong) HYTransitionAnimation *presentAnimation;
/** dismiss动画 */
@property (nonatomic, strong) HYTransitionAnimation *dismissAnimation;

#pragma mark - present/dismiss 转场
/**
 present

 @param viewControllerToPresent viewControllerToPresent 目标控制器
 @param flag 动画flag
 @param completion 完成回调
 */
- (void)hy_presentViewController:(UIViewController *)viewControllerToPresent
                        animated:(BOOL)flag
                      completion:(void (^ __nullable)(void))completion;

/**
 dismiss

 @param flag 动画flag
 @param completion 完成回调
 */
- (void)hy_dismissViewControllerAnimated:(BOOL)flag
                              completion:(void (^ __nullable)(void))completion;


@end

NS_ASSUME_NONNULL_END
