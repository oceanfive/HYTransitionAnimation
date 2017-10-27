//
//  AnimationListViewController.m
//  HYTransitionAnimationDemo
//
//  Created by ocean on 2017/8/31.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "AnimationListViewController.h"
#import "HYTransitionAnimationHeader.h"
#import "PushViewController.h"

#define kList @"list"
#define kTitle @"title"

@interface AnimationListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *data;

@end

@implementation AnimationListViewController

#pragma mark - lazy
- (UITableView *)tableView{
    if (!_tableView) {
        CGRect bounds = self.view.bounds;
        bounds.size.height -= 64;
        _tableView = [[UITableView alloc] initWithFrame:bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)data{
    if (!_data) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 1; i++) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            
            [dict setObject:@"系统" forKey:kTitle];
            
            NSMutableArray *list = [NSMutableArray array];
            [list addObject:@"HYTransitionAnimationTypeFade(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypeMoveIn(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypePush(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypeReveal(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypeCube(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypeSuckEffect(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypeOglFlip(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypeRippleEffect(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypePageCurl(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypePageUnCurl(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypeCameraIrisHollowOpen(present 不可用)"];
            [list addObject:@"HYTransitionAnimationTypeCameraIrisHollowOpen(present 不可用)"];
            [dict setObject:list forKey:kList];
            
            [array addObject:dict];
        }
        
        for (int i = 0; i < 1; i++) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            
            [dict setObject:@"HYPortalTransitionAnimation" forKey:kTitle];
            
            NSMutableArray *list = [NSMutableArray array];
            [list addObject:@"HYLeftRightClosePortalTransitionAnimationDirectiong"];
            [list addObject:@"HYLeftRightOpenPortalTransitionAnimationDirection"];
            [list addObject:@"HYTopBottomClosePortalTransitionAnimationDirection"];
            [list addObject:@"HYTopBottomOpenPortalTransitionAnimationDirection"];
            [dict setObject:list forKey:kList];
            
            [array addObject:dict];
        }
        
        _data = [NSArray arrayWithArray:array];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"选择动画";
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dict = self.data[section];
    return [[dict objectForKey:kList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [NSString stringWithFormat:@"%ld-%ld", indexPath.section, indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *dict = self.data[indexPath.section];
    NSArray *list = [dict objectForKey:kList];
    cell.textLabel.text = list[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSDictionary *dict = self.data[section];
    NSString *title = [dict objectForKey:kTitle];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:20.0f];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.userInteractionEnabled = YES;
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    return label;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    HYTransitionAnimation *animation;
    
    switch (indexPath.section) {
        case 0:
        {
            NSDictionary *dict = self.data[indexPath.section];
            
            HYSystemTransitionAnimation *anim = [[HYSystemTransitionAnimation alloc] init];
            anim.type = indexPath.row;

            animation = anim;
            
        }
            break;
            
        case 1:
        {
            switch (indexPath.row) {
                case 0: {
                    HYLeftRightClosePortalTransitionAnimationDirection *anim = [[HYLeftRightClosePortalTransitionAnimationDirection alloc] init];
                    animation = anim;
                } break;

                case 1: {
                    HYLeftRightOpenPortalTransitionAnimationDirection *anim = [[HYLeftRightOpenPortalTransitionAnimationDirection alloc] init];
                    animation = anim;
                } break;
                    
                case 2: {
                    HYTopBottomClosePortalTransitionAnimationDirection *anim = [[HYTopBottomClosePortalTransitionAnimationDirection alloc] init];
                    animation = anim;
                } break;
                    
                case 3: {
                    HYTopBottomOpenPortalTransitionAnimationDirection *anim = [[HYTopBottomOpenPortalTransitionAnimationDirection alloc] init];
                    animation = anim;
                } break;
                    
                default:
                    break;
            }
        
        }
            break;
            
        default:
            break;
    }
    
    NSArray *controllers = self.navigationController.viewControllers;
    UIViewController *vcTemp = controllers[controllers.count - 1 - 1];
    if ([vcTemp isKindOfClass:[PushViewController class]]) {
        PushViewController *vc = (PushViewController *)vcTemp;
        vc.animation = animation;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
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
