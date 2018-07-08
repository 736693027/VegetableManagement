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
#import "UIViewController+MMDrawerController.h"
#import "VMOrderDetailViewController.h"
#import "VMNewTaskListAPI.h"

@interface VMNewTaskViewController ()

@end

@implementation VMNewTaskViewController

/**
 *  加载控制器的时候设置打开抽屉模式  (因为在后面会关闭)
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置打开抽屉模式
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //导航左侧按钮设置
    [navLeftBtn setImage:[UIImage imageNamed:@"icon_toUserPhoto"] forState:UIControlStateNormal];
    
    //tabBar按钮bridge设置
    VMTabBarController *tabBarVC = (VMTabBarController *)self.tabBarController;
    [tabBarVC setTabBarItemBridge:2 withIndex:0];
    
    self.dataTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarHeight);
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.dataTableView.separatorColor = [CommonTools changeColor:@"0xcccccc"];
    NSString *cellClassName = NSStringFromClass([VMNewTaskTableViewCell class]);
    [self tableRegisterNibName:cellClassName cellReuseIdentifier:cellClassName estimatedRowHeight:266];
}
#pragma mark nav leftBarBtn click
- (void)navLeftButtonClicked:(UIButton *)sender {
    //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

#pragma mark tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMNewTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMNewTaskTableViewCell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VMOrderDetailViewController *orderDetailVC = [[VMOrderDetailViewController alloc] init];
    orderDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}

- (void)requestData{
    [SVProgressHUD show];
    if([self.dataTableView.mj_header isRefreshing]){
        [self.dataTableView.mj_header endRefreshing];
    }else{
        [self.dataTableView.mj_footer endRefreshing];
    }
    VMNewTaskListAPI *taskListAPI = [[VMNewTaskListAPI alloc] init];
    [taskListAPI startRequestWithArraySuccess:^(NSArray *responseArray) {
        [SVProgressHUD dismiss];
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.message];
    } fail:^(YTKBaseRequest *request) {
         [SVProgressHUD showErrorWithStatus:@"列表数据获取失败"];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
