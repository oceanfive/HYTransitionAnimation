//
//  UINavigationController+HYTransitionAnimation.h
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2019/1/23.
//  Copyright © 2019 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYTransitionAnimation;

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (HYTransitionAnimation)<UINavigationControllerDelegate>

/**
 push

 @param viewController viewController
 @param animated animated
 */
- (void)hy_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;


/**
 pop

 @param animated animated
 */
- (void)hy_popViewControllerAnimated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END
