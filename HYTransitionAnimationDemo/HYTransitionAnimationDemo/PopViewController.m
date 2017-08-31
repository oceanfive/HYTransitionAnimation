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
}

- (void)myButtonClick:(UIButton *)button{
    
    if (button.tag == kPopButtonTag) {
        
        HYTopBottomClosePortalTransitionAnimationDirection *anim = [[HYTopBottomClosePortalTransitionAnimationDirection alloc] init];
        [self.navigationController hy_popViewControllerAnimation:anim];
        
    } else {
        
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
