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
#import "VMOrderStatisticsModel.h"

@interface VMOrderStatisticsViewController ()

@property (copy, nonatomic) NSString *startTime;
@property (copy, nonatomic) NSString *endTime;
@property (assign, nonatomic) BOOL isSearchState;

@end

@implementation VMOrderStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"配送统计";
    self.isSearchState = NO;
    [self.dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.offset(0);
    }];
    @weakify(self)
    VMVMOrderStatisticsTableHeaderView *tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"VMVMOrderStatisticsTableHeaderView" owner:self options:nil] lastObject];
    tableHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 70);
    tableHeaderView.resltSubject = [RACSubject subject];
    [tableHeaderView.resltSubject subscribeNext:^(NSDictionary * _Nullable parameter) {
        @strongify(self)
        self.startTime = [parameter objectForKey:@"startTime"];
        self.endTime = [parameter objectForKey:@"endTime"];
        self.isSearchState = YES;
        [self.dataTableView.mj_header beginRefreshing];
    }];
    self.dataTableView.tableHeaderView = tableHeaderView;
    
    NSString *cellName = NSStringFromClass([VMVMOrderStatisticsTableViewCell class]);
    [self tableRegisterNibName:cellName cellReuseIdentifier:cellName estimatedRowHeight:155];
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.isSearchState){
        return 1;
    }else{
        return self.dataArray.count==0?0:3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMVMOrderStatisticsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMVMOrderStatisticsTableViewCell"];
    VMOrderStatisticsModel *itemModel = [self.dataArray objectAtIndex:0];
    [cell setItemModel:itemModel index:indexPath.row isSearchResult:self.isSearchState];
    return cell;
}
- (void)requestData{
    [SVProgressHUD showWithStatus:@"加载中..."];
    if([self.dataTableView.mj_header isRefreshing]){
        [self.dataTableView.mj_header endRefreshing];
    }else{
        [self.dataTableView.mj_footer endRefreshing];
    }
    VMGetOrderStatisticsListAPI *orderStatisticsList = [[VMGetOrderStatisticsListAPI alloc] initWithStartTime:self.startTime endTime:self.endTime];
    [orderStatisticsList startRequestWithDicSuccess:^(NSDictionary *responseDic) {
        [SVProgressHUD dismiss];
        [self.dataArray removeAllObjects];
        VMOrderStatisticsModel *model = [VMOrderStatisticsModel yy_modelWithJSON:responseDic];
        if(model){
            [self.dataArray addObject:model];
        }
        [self.dataTableView reloadData];
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
