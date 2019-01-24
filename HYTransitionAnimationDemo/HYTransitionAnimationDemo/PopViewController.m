//
//  PopViewController.m
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/31.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "PopViewController.h"

#import "HYTransitionAnimationHeader.h"

#define kPopButtonTag 200
#define kDismissButtonTag 205

@interface PopViewController ()

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransition;

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"pop";
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.backgroundColor = [UIColor redColor];
    [myButton setTitle:@"pop" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    myButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [myButton addTarget:self action:@selector(myButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton];
    myButton.tag = kPopButtonTag;
    myButton.frame = CGRectMake(200, 100, 100, 80);
    
    
    UIButton *myButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton2.backgroundColor = [UIColor redColor];
    [myButton2 setTitle:@"dismiss" forState:UIControlStateNormal];
    [myButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    myButton2.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [myButton2 addTarget:self action:@selector(myButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton2];
    myButton2.tag = kDismissButtonTag;
    myButton2.frame = CGRectMake(200, 400, 100, 80);
    
    
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleScreenEdgePanGestureRecognizer:)];
    gesture.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:gesture];
}

- (void)myButtonClick:(UIButton *)button{
    
//    HYTopBottomClosePortalTransitionAnimationDirection *anim = [[HYTopBottomClosePortalTransitionAnimationDirection alloc] init];
//    self.popAnimation = anim;
//    self.dismissAnimation = anim;
    
    if (button.tag == kPopButtonTag) {
        
        self.popInteractiveTransition = nil;
        
        [self.navigationController hy_popViewControllerAnimated:YES];
        
    } else {
        // 不需要交互式转场动画
        self.dismissInteractiveTransition = nil;
        [self hy_dismissViewControllerAnimated:YES completion:NULL];
//        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
}


- (void)handleScreenEdgePanGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)gesture {
//    CGFloat progress = [gesture translationInView:self.view].x / self.view.bounds.size.width;
    CGFloat progress = [gesture translationInView:self.view].x / self.view.bounds.size.width;
    
    // 把这个百分比限制在0~1之间
    progress = MIN(1.0, MAX(0.0, progress));
    NSLog(@"progress: %f", progress);
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            {
//                [self.navigationController popViewControllerAnimated:YES];
                NSLog(@"UIGestureRecognizerStateBegan =====");

                if (self.pushed) {
                    // 置空
                    self.popInteractiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
                    
                    [self.navigationController hy_popViewControllerAnimated:YES];
                } else {
                    UIPercentDrivenInteractiveTransition *transition = [[UIPercentDrivenInteractiveTransition alloc] init];
                    self.dismissInteractiveTransition = transition;
                    
                    [self hy_dismissViewControllerAnimated:YES completion:NULL];
                }
            }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            NSLog(@"UIGestureRecognizerStateChanged =====");
            
            if (self.pushed) {
                [self.popInteractiveTransition updateInteractiveTransition:progress];
            } else {
                [self.dismissInteractiveTransition updateInteractiveTransition:progress];
            }
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"UIGestureRecognizerStateEnded =====");
            
            if (progress > 0.5) {
                if (self.pushed) {
                    [self.popInteractiveTransition finishInteractiveTransition];
                } else {
                    [self.dismissInteractiveTransition finishInteractiveTransition];
                }
            } else {
                if (self.pushed) {
                    [self.popInteractiveTransition cancelInteractiveTransition];
                } else {
                    [self.dismissInteractiveTransition cancelInteractiveTransition];
                }
            }
        }
            break;
            
        case UIGestureRecognizerStateCancelled:
        {
            NSLog(@"UIGestureRecognizerStateCancelled =====");
            
            if (self.pushed) {
                [self.popInteractiveTransition cancelInteractiveTransition];
            } else {
                [self.dismissInteractiveTransition cancelInteractiveTransition];
            }
        }
            break;
            
        default:
        {
            NSLog(@"default =====");
        }
            
            break;
    }
    
}


@end
