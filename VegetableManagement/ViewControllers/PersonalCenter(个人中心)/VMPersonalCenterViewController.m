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
#import "VMGetPersonalInfoAPI.h"
#import "VMLoginUserInfoModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "VMNavigationController.h"

@interface VMPersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *dataTableView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *workStateSwitch;
@property (weak, nonatomic) IBOutlet UILabel *orderCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;

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
    [SVProgressHUD showWithStatus:@"加载中..."];
    VMGetPersonalInfoAPI *getPersonInfoRequest = [[VMGetPersonalInfoAPI alloc] init];
    [getPersonInfoRequest startRequestWithDicSuccess:^(NSDictionary *responseDic) {
        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        VMLoginUserInfoModel *loginModel = [VMLoginUserInfoModel loginUsrInfoModel];
        VMLoginUserInfoModel *tmpLoginModel = [VMLoginUserInfoModel yy_modelWithJSON:responseDic];
        loginModel = [tmpLoginModel copy];
        
        if(loginModel.startState.integerValue == 1){
            self.workStateSwitch.on = YES;
        }else{
            self.workStateSwitch.on = NO;
        }
        self.userNameLabel.text = loginModel.username;
        NSString *headImageUrl = [NSString stringWithFormat:@"%@%@",BASEURL,loginModel.avatar];
        [self.userHeadImageView sd_setImageWithURL:[NSURL URLWithString:headImageUrl] placeholderImage:[UIImage imageNamed:@"user_photo"]];
        NSInteger totalAmount = loginModel.commission.integerValue*loginModel.orderAmount.integerValue;
        self.totalAmountLabel.text = [NSString stringWithFormat:@"今日佣金 %ld",totalAmount];
        self.orderCountLabel.text = [NSString stringWithFormat:@"累计单量 %@",loginModel.orderAmount];
        
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.msg];
    } fail:^(YTKBaseRequest *request) {
        
    }];
}

- (IBAction)noticeBtnClick:(UIButton *)sender {
    //拿到我们的LitterLCenterViewController，让它去push
    UITabBarController* tabBarViewController = (UITabBarController*)self.mm_drawerController.centerViewController;
    VMNavigationController *currentNav = tabBarViewController.selectedViewController;
    VMMessageCenterViewController *messagerCenterVC = [[VMMessageCenterViewController alloc] init];
    messagerCenterVC.hidesBottomBarWhenPushed = YES;
    [currentNav pushViewController:messagerCenterVC animated:NO];
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    }];
}

- (IBAction)helpBtnClick:(UIButton *)sender {
    VMHelpViewController *helpVC = [[VMHelpViewController alloc] init];
    UITabBarController* tabBarViewController = (UITabBarController*)self.mm_drawerController.centerViewController;
    VMNavigationController *currentNav = tabBarViewController.selectedViewController;
    [currentNav pushViewController:helpVC animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
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
    UITabBarController* tabBarViewController = (UITabBarController*)self.mm_drawerController.centerViewController;
    VMNavigationController *currentNav = tabBarViewController.selectedViewController;
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
                [currentNav pushViewController:finishedVC animated:YES];
            }
                break;
                //配送统计
            case 2:
            {
                VMOrderStatisticsViewController *orderStatisticsVC = [[VMOrderStatisticsViewController alloc] init];
                orderStatisticsVC.hidesBottomBarWhenPushed = YES;
                [currentNav pushViewController:orderStatisticsVC animated:YES];
            }
                break;
                //我的评价
            case 3:
            {
                VMEvaluationTableViewController *evaluationVC = [[VMEvaluationTableViewController alloc] init];
                evaluationVC.hidesBottomBarWhenPushed = YES;
                [currentNav pushViewController:evaluationVC animated:YES];
            }
                break;
                //设置
            case 4:
            {
                
                VMSetupViewController *setupVC = [[VMSetupViewController alloc] init];
                setupVC.hidesBottomBarWhenPushed = YES;
                [currentNav pushViewController:setupVC animated:YES];
                
            }
                break;
            default:
                break;
        }
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
