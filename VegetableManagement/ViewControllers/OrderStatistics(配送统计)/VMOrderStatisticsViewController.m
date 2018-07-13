//
//  VMOrderStatisticsViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMOrderStatisticsViewController.h"
#import "VMVMOrderStatisticsTableHeaderView.h"
#import "VMVMOrderStatisticsTableViewCell.h"
#import <Masonry/Masonry.h>
#import "VMGetOrderStatisticsListAPI.h"

@interface VMOrderStatisticsViewController ()

@end

@implementation VMOrderStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"配送统计";
    
    [self.dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.offset(0);
    }];
    VMVMOrderStatisticsTableHeaderView *tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"VMVMOrderStatisticsTableHeaderView" owner:self options:nil] lastObject];
    tableHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 70);
    self.dataTableView.tableHeaderView = tableHeaderView;
    
    NSString *cellName = NSStringFromClass([VMVMOrderStatisticsTableViewCell class]);
    [self tableRegisterNibName:cellName cellReuseIdentifier:cellName estimatedRowHeight:155];
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMVMOrderStatisticsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMVMOrderStatisticsTableViewCell"];
    return cell;
}
- (void)requestData{
    VMGetOrderStatisticsListAPI *orderStatisticsList = [[VMGetOrderStatisticsListAPI alloc] init];
    [orderStatisticsList startRequestWithArraySuccess:^(NSArray *responseArray) {
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
