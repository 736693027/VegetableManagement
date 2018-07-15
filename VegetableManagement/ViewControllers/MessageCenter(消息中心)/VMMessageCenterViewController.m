//
//  VMMessageCenterViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMMessageCenterViewController.h"
#import "VMMessageCenterTableViewCell.h"
#import "VMMessageDetailViewController.h"
#import "VMGetMessageCenterListAPI.h"
#import "VMMessageCenterModel.h"

@interface VMMessageCenterViewController ()

@end

@implementation VMMessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    self.dataTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    NSString *cellClassName = NSStringFromClass([VMMessageCenterTableViewCell class]);
    [self tableRegisterNibName:cellClassName cellReuseIdentifier:cellClassName estimatedRowHeight:64];
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMMessageCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VMMessageCenterTableViewCell class])];
    VMMessageCenterModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.itemModel = model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VMMessageDetailViewController *detailVC = [[VMMessageDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)requestData{
    [SVProgressHUD showWithStatus:@"加载中..."];
    if([self.dataTableView.mj_header isRefreshing]){
        [self.dataTableView.mj_header endRefreshing];
    }else{
        [self.dataTableView.mj_footer endRefreshing];
    }
    VMGetMessageCenterListAPI *getListData = [[VMGetMessageCenterListAPI alloc] initWithPage:self.pageNumber row:10];
    [getListData startRequestWithDicSuccess:^(NSDictionary *responseDic) {
        [SVProgressHUD dismiss];
        if(self.pageNumber == 1){
            [self.dataArray removeAllObjects];
        }
        NSArray *itemArrays = [responseDic objectForKey:@"list"];
        if(itemArrays.count>0){
            [self.dataArray addObjectsFromArray:[NSArray yy_modelArrayWithClass:[VMMessageCenterModel class] json:itemArrays]];
            [self.dataTableView reloadData];
        }
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.msg];
    } fail:^(YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
