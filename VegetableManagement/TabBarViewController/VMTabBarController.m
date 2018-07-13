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
#import "VMGetTablCountAPI.h"
#import "VMLoginUserInfoModel.h"
#import "VMLoginViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface VMTabBarController ()<CustomerTabBarViewDelegate>{
    VMCustomTabBar *tabBar;
}

@end

@implementation VMTabBarController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    VMLoginUserInfoModel *loginUserInfo = [VMLoginUserInfoModel loginUsrInfoModel];
//    if(!loginUserInfo.lgoinUserId){
//        [self jumpToLoginViewController];
//    }
}
- (void)jumpToLoginViewController{
    VMLoginViewController *loginVC = [[VMLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:VMLogoutNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        [self jumpToLoginViewController];
    }];
    tabBar = [[VMCustomTabBar alloc] init];
    tabBar.tabBarView.viewDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self addAllChildViewController];
    
    VMGetTablCountAPI *getTabCount = [[VMGetTablCountAPI alloc] init];
    [getTabCount startRequestWithDicSuccess:^(NSDictionary *responseDic) {
        NSNumber *newTaskNumber = [responseDic objectForKey:@"newTask"];
        NSNumber *pickupNumber = [responseDic objectForKey:@"pickup"];
        NSNumber *distributionNumber = [responseDic objectForKey:@"distribution"];
        @strongify(self)
        [self setTabBarItemBridge:newTaskNumber.integerValue withIndex:0];
        [self setTabBarItemBridge:pickupNumber.integerValue withIndex:1];
        [self setTabBarItemBridge:distributionNumber.integerValue withIndex:2];
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.msg];
    } fail:^(YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"标签总数获取失败"];
    }];
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
    frame.size.height = TabBarHeight;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    self.tabBar.frame = frame;
//    self.tabBar.backgroundColor = [UIColor blackColor];
//    self.tabBar.barStyle = UIBarStyleBlack;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
