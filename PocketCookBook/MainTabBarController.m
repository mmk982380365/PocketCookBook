//
//  MainTabBarController.m
//  PocketCookBook
//
//  Created by 马鸣坤 on 15/9/23.
//  Copyright (c) 2015年 sdzy. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.barTintColor=[UIColor colorWithRed:1.000 green:0.040 blue:0.000 alpha:1.000];
    BaseNavigationController *n1=[[BaseNavigationController alloc] init];
    n1.title=@"菜谱";
    BaseNavigationController *n2=[[BaseNavigationController alloc] init];
    n2.title=@"菜圈";
    BaseNavigationController *n3=[[BaseNavigationController alloc] init];
    n3.title=@"菜";
    BaseNavigationController *n4=[[BaseNavigationController alloc] init];
    n4.title=@"我的";
    NSArray *viewControllers=@[n1,n2,n3,n4];
    self.viewControllers=viewControllers;
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
