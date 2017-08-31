//
//  ViewController.m
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/30.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+HYTransitionAnimationCategory.h"
#import "UIViewController+HYTransitionAnimationCategory.h"
#import "HYTransitionAnimationHeader.h"
#import "PushViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.backgroundColor = [UIColor redColor];
    [myButton setTitle:@"push" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    myButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [myButton addTarget:self action:@selector(myButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton];
    myButton.frame = CGRectMake(50, 100, 100, 80);
    
}



- (void)myButtonClick:(UIButton *)button{
    PushViewController *vc = [[PushViewController alloc] init];
    
    HYFlipTransitionAnimation *anim = [[HYFlipTransitionAnimation alloc] init];
    anim.operation = HYFlipTransitionAnimationOperationForward;
    anim.position = HYFlipTransitionAnimationPositonVerticalCenter;
    anim.duration = 5;
    [self.navigationController hy_pushViewController:vc animation:anim];
    
    //    NSLayoutAttribute
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
