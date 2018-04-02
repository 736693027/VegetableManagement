//
//  VMNewTaskViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMNewTaskViewController.h"
#import "VMTabBarController.h"
#import "VMNewTaskTableViewCell.h"
#import "VMPersonalCenterViewController.h"

@interface VMNewTaskViewController ()

@end

@implementation VMNewTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //导航左侧按钮设置
    [navLeftBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    
    //tabBar按钮bridge设置
    VMTabBarController *tabBarVC = (VMTabBarController *)self.tabBarController;
    [tabBarVC setTabBarItemBridge:2 withIndex:0];
    
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.dataTableView.separatorColor = [UIColor greenColor];
    self.dataTableView.rowHeight = UITableViewAutomaticDimension;
    self.dataTableView.estimatedRowHeight = 245;
    [self.dataTableView registerNib:[UINib nibWithNibName:@"VMNewTaskTableViewCell" bundle:nil] forCellReuseIdentifier:@"VMNewTaskTableViewCell"];
}

#pragma mark nav leftBarBtn click
- (void)navLeftButtonClicked:(UIButton *)sender {
    VMPersonalCenterViewController *personalCenterVC = [[VMPersonalCenterViewController alloc] init];
    personalCenterVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:personalCenterVC animated:YES];
}

#pragma mark tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMNewTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMNewTaskTableViewCell"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
