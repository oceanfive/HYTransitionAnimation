//
//  PushViewController.m
//  HYKit
//
//  Created by ocean on 2017/8/4.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "PushViewController.h"
#import "HYTransitionAnimationHeader.h"
#import "PopViewController.h"
#import "AnimationListViewController.h"

#define kPushButtonTag 200
#define kPresentButtonTag 205

@interface PushViewController ()<UINavigationControllerDelegate>

@end

@implementation PushViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"push";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.backgroundColor = [UIColor redColor];
    [myButton setTitle:@"push" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    myButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [myButton addTarget:self action:@selector(myButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton];
    myButton.tag = kPushButtonTag;
    myButton.frame = CGRectMake(50, 100, 100, 80);
 
    
    UIButton *myButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton2.backgroundColor = [UIColor redColor];
    [myButton2 setTitle:@"present" forState:UIControlStateNormal];
    [myButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    myButton2.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [myButton2 addTarget:self action:@selector(myButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton2];
    myButton2.tag = kPresentButtonTag;
    myButton2.frame = CGRectMake(50, 300, 100, 80);
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(chooseAnimation)];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)myButtonClick:(UIButton *)button{
    
    PopViewController *vc = [[PopViewController alloc] init];
    
    if (button.tag == kPushButtonTag) {
        
        [self.navigationController hy_pushViewController:vc animation:self.animation];
        
    } else {
        
        [self hy_presentViewController:vc animation:self.animation];

    }
    

    //    NSLayoutAttribute
}

#pragma mark - 选择动画类型
- (void)chooseAnimation{
    AnimationListViewController *vc = [[AnimationListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
