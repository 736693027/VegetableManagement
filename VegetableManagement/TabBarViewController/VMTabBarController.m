//
//  VMTabBarController.m
//  VegetableManagement
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMTabBarController.h"
#import "VMCustomTabBar.h"
#import "CustomerTabBarView.h"
#import "VMNewTaskViewController.h"
#import "VMWaitPickUpViewController.h"
#import "VMDeliveryOrderViewController.h"
#import "VMNavigationController.h"

@interface VMTabBarController ()<CustomerTabBarViewDelegate>{
    VMCustomTabBar *tabBar;
}

@end

@implementation VMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tabBar = [[VMCustomTabBar alloc] init];
    tabBar.tabBarView.viewDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self addAllChildViewController];
}

- (void)addAllChildViewController{
    VMNewTaskViewController *newTaskVC = [[VMNewTaskViewController alloc] init];
    [self addChildViewController:newTaskVC navTitle:@"抢单大厅"];
   
    VMWaitPickUpViewController *waitPickUpVC = [[VMWaitPickUpViewController alloc] init];
    [self addChildViewController:waitPickUpVC navTitle:@"抢单大厅"];
    
    VMDeliveryOrderViewController *deliverOrderVC = [[VMDeliveryOrderViewController alloc] init];
    [self addChildViewController:deliverOrderVC navTitle:@"抢单大厅"];
}

- (void)addChildViewController:(UIViewController *)childController navTitle:(NSString *)title {
    VMNavigationController *nav = [[VMNavigationController alloc] initWithRootViewController:childController];
    childController.navigationItem.title = @"抢单大厅";
    [self addChildViewController:nav];
}

- (void)msTabBarView:(CustomerTabBarView *)view didSelectItemAtIndex:(NSInteger)index{
    self.selectedIndex = index;
}

- (void)setTabBarItemBridge:(NSInteger)count withIndex:(NSInteger)index{
    [tabBar.tabBarView setItemBridge:count atIndex:index];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect frame = self.tabBar.frame;
    frame.size.height = 60;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    self.tabBar.frame = frame;
//    self.tabBar.backgroundColor = [UIColor blackColor];
//    self.tabBar.barStyle = UIBarStyleBlack;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
