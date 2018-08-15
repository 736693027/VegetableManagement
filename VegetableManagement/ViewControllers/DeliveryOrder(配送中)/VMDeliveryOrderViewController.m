//
//  VMDeliveryOrderViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMDeliveryOrderViewController.h"
#import "VMWaitPickUpTableViewCell.h"
#import "UIViewController+MMDrawerController.h"
#import "VMDeliveryOrderGetListAPI.h"
#import "VMNewTaskItemModel.h"

@interface VMDeliveryOrderViewController ()

@end

@implementation VMDeliveryOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航左侧按钮设置
    [navLeftBtn setImage:[UIImage imageNamed:@"icon_toUserPhoto"] forState:UIControlStateNormal];
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.dataTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarHeight);
    self.dataTableView.separatorColor = [CommonTools changeColor:@"0xcccccc"];
    NSString *cellClassName = NSStringFromClass([VMWaitPickUpTableViewCell class]);
    [self tableRegisterNibName:cellClassName cellReuseIdentifier:cellClassName estimatedRowHeight:245];
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
    VMWaitPickUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMWaitPickUpTableViewCell"];
    [cell.operatingBtn setBackgroundImage:[UIImage imageNamed:@"icon_deliverdBtn"] forState:UIControlStateNormal];
    return cell;
}

- (void)requestData{
    [SVProgressHUD showWithStatus:@"加载中..."];
    if([self.dataTableView.mj_header isRefreshing]){
        [self.dataTableView.mj_header endRefreshing];
    }else{
        [self.dataTableView.mj_footer endRefreshing];
    }
    VMDeliveryOrderGetListAPI *getListAPI = [[VMDeliveryOrderGetListAPI alloc] initWithPage:self.pageNumber row:10];
    [getListAPI startRequestWithDicSuccess:^(NSDictionary *responseDic) {
        [SVProgressHUD dismiss];
        if(self.pageNumber == 1){
            [self.dataArray removeAllObjects];
        }
        NSArray *itemArrays = [responseDic objectForKey:@"list"];
        if(itemArrays.count>0){
            [self.dataArray addObjectsFromArray:[NSArray yy_modelArrayWithClass:[VMNewTaskItemModel class] json:itemArrays]];
            [self.dataTableView reloadData];
        }
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.msg];
    } fail:^(YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"待取货列表获取失败"];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
