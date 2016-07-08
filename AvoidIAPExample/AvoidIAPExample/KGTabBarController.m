//
//  KGTabBarController.m
//  Baisibudejie
//
//  Created by 马文帅 on 16/3/1.
//  Copyright © 2016年 yikang. All rights reserved.
//

#import "KGTabBarController.h"
#import "OneVC.h"
#import "TwoVC.h"
#import "ThreeVC.h"
#import "FourVC.h"

@interface KGTabBarController ()
@end

@implementation KGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    OneVC *oneVC= [[OneVC alloc] init];
    [self setupChildVC:oneVC title:@"one"];
    
    //本地有值，说明在审核状态，否则是普通状态
    BOOL isReveiw = [[NSUserDefaults standardUserDefaults] objectForKey:KIsReviewKey];
    if (!isReveiw) {
        TwoVC *twoVC= [[TwoVC alloc] init];
        [self setupChildVC:twoVC title:@"two"];
    }
  
    ThreeVC *threeVC= [[ThreeVC alloc] init];
    [self setupChildVC:threeVC title:@"three"];
    
    FourVC *fourVC= [[FourVC alloc] init];
    [self setupChildVC:fourVC title:@"four"];
}

- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title {
    vc.title = title;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
