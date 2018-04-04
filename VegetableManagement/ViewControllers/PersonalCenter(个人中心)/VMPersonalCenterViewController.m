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

@interface VMPersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@property (strong, nonatomic) NSArray *titleArray;

@end

@implementation VMPersonalCenterViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@[@"待完成",@"已完成",@"配送统计",@"我的评价"],@[@"设置",@"通知",@"帮助"]];
    self.dataTableView.rowHeight = UITableViewAutomaticDimension;
    self.dataTableView.estimatedRowHeight = 44;
    [self.dataTableView registerNib:[UINib nibWithNibName:@"VMPersonalCenterTableViewCell" bundle:nil] forCellReuseIdentifier:@"VMPersonalCenterTableViewCell"];
}
#pragma mark tableView datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titleArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *tmpArray = _titleArray[section];
    return tmpArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMPersonalCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMPersonalCenterTableViewCell"];
    NSArray *tmpArray = _titleArray[indexPath.section];
    cell.titleLabel.text = tmpArray[indexPath.row];
    return cell;
}
#pragma mark tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        switch (indexPath.row) {
            case 0:
            {
                
            }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                
            }
                break;
            case 3:
            {
                
            }
                break;
                
            default:
                break;
        }
    }else{
        switch (indexPath.row) {
            case 0:
            {
                //拿到我们的LitterLCenterViewController，让它去push
                UITabBarController* nav = (UITabBarController*)self.mm_drawerController.centerViewController;
                NSArray *arr = nav.viewControllers;
                VMSetupViewController *setupVC = [[VMSetupViewController alloc] init];
                [arr[0] pushViewController:setupVC animated:NO];
                //当我们push成功之后，关闭我们的抽屉
                [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                    //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
                    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
                }];
            }
                break;
            case 1:
            {
                VMMessageCenterViewController *messagerCenterVC = [[VMMessageCenterViewController alloc] init];
                [self.navigationController pushViewController:messagerCenterVC animated:YES];
            }
                break;
            case 2:
            {
                VMHelpViewController *helpVC = [[VMHelpViewController alloc] init];
                [self.navigationController pushViewController:helpVC animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
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
