//
//  VMPersonalCenterViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMPersonalCenterViewController.h"
#import "VMPersonalCenterTableViewCell.h"
#import "VMSetupViewController.h"
#import "VMHelpViewController.h"
#import "VMMessageCenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "VMFinishedOrderViewController.h"
#import "VMEvaluationTableViewController.h"
#import "VMOrderStatisticsViewController.h"

@interface VMPersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@property (strong, nonatomic) NSArray *titleArray;
@property (strong, nonatomic) NSArray *cellIconImageArray;

@end

@implementation VMPersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"待完成",@"已完成",@"配送统计",@"我的评价",@"设置"];
    _cellIconImageArray = @[@"icon_unfinished",@"icon_finished",@"icon_statistics",@"icon_evaluate",@"icon_setting"];
    self.dataTableView.rowHeight = UITableViewAutomaticDimension;
    self.dataTableView.estimatedRowHeight = 51;
    [self.dataTableView registerNib:[UINib nibWithNibName:@"VMPersonalCenterTableViewCell" bundle:nil] forCellReuseIdentifier:@"VMPersonalCenterTableViewCell"];
}

- (IBAction)noticeBtnClick:(UIButton *)sender {
    
    //拿到我们的LitterLCenterViewController，让它去push
    UITabBarController* nav = (UITabBarController*)self.mm_drawerController.centerViewController;
    NSArray *arr = nav.viewControllers;
    VMMessageCenterViewController *messagerCenterVC = [[VMMessageCenterViewController alloc] init];
    messagerCenterVC.hidesBottomBarWhenPushed = YES;
    [arr[0] pushViewController:messagerCenterVC animated:NO];
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}

- (IBAction)helpBtnClick:(UIButton *)sender {
    VMHelpViewController *helpVC = [[VMHelpViewController alloc] init];
    helpVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:helpVC animated:YES];
    UITabBarController *tabBarController = (UITabBarController *)self.mm_drawerController.centerViewController;
    NSArray *arr = tabBarController.viewControllers;
    [arr[0] pushViewController:helpVC animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}

#pragma mark tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMPersonalCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMPersonalCenterTableViewCell"];
    cell.titleLabel.text = _titleArray[indexPath.row];
    [cell.iconImageview setImage:[UIImage imageNamed:_cellIconImageArray[indexPath.row]]];
    return cell;
}

#pragma mark tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //拿到我们的LitterLCenterViewController，让它去push
    UITabBarController* nav = (UITabBarController*)self.mm_drawerController.centerViewController;
    NSArray *arr = nav.viewControllers;
        switch (indexPath.row) {
                //待完成
            case 0:
            {
                
            }
                break;
                //已完成
            case 1:
            {
                VMFinishedOrderViewController *finishedVC = [[VMFinishedOrderViewController alloc] init];
                finishedVC.hidesBottomBarWhenPushed = YES;
                [arr[0] pushViewController:finishedVC animated:NO];
            }
                break;
                //配送统计
            case 2:
            {
                VMOrderStatisticsViewController *orderStatisticsVC = [[VMOrderStatisticsViewController alloc] init];
                orderStatisticsVC.hidesBottomBarWhenPushed = YES;
                [arr[0] pushViewController:orderStatisticsVC animated:NO];
            }
                break;
                //我的评价
            case 3:
            {
                VMEvaluationTableViewController *evaluationVC = [[VMEvaluationTableViewController alloc] init];
                evaluationVC.hidesBottomBarWhenPushed = YES;
                [arr[0] pushViewController:evaluationVC animated:NO];
            }
                break;
                //设置
            case 4:
            {
                
                VMSetupViewController *setupVC = [[VMSetupViewController alloc] init];
                setupVC.hidesBottomBarWhenPushed = YES;
                [arr[0] pushViewController:setupVC animated:NO];
                
            }
                break;
            default:
                break;
        }
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
