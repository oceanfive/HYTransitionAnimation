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

#pragma mark - TransitionAnimation
/** push动画 */
@property (nonatomic, strong) HYTransitionAnimation *pushAnimation;
/** pop动画 */
@property (nonatomic, strong) HYTransitionAnimation *popAnimation;
/** present动画 */
@property (nonatomic, strong) HYTransitionAnimation *presentAnimation;
/** dismiss动画 */
@property (nonatomic, strong) HYTransitionAnimation *dismissAnimation;

#pragma mark - InteractiveTransition (注意：不需要的时候设置为nil)
/** present 交互式转场 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *presentInteractiveTransition;
/** dismiss 交互式转场 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition * dismissInteractiveTransition;
/** push 交互式转场 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *pushInteractiveTransition;
/** pop 交互式转场 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition * popInteractiveTransition;

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
 dismiss，不需要交互式转场动画

 @param flag 动画flag
 @param completion 完成回调
 */
- (void)hy_dismissViewControllerAnimated:(BOOL)flag
                              completion:(void (^ __nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
