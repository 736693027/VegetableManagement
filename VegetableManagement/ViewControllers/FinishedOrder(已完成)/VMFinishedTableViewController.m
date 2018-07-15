//
//  VMFinishedTableViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMFinishedTableViewController.h"
#import "VMFinishedTableViewCell.h"
#import "VMFinishedTableHeadView.h"
#import <Masonry/Masonry.h>
#import "VMGetFinishedOrderListAPI.h"
#import "VMGetFinishedOrderCancleListAPI.h"

@interface VMFinishedTableViewController ()

@end

@implementation VMFinishedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    VMFinishedTableHeadView *tableHeadView = [[[NSBundle mainBundle] loadNibNamed:@"VMFinishedTableHeadView" owner:self options:nil] lastObject];
    [self.view addSubview:tableHeadView];
    [tableHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.offset(0);
        make.height.offset(50);
        make.width.offset(SCREEN_WIDTH);
    }];
    
    [self.dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tableHeadView.mas_bottom);
        make.left.offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.width.offset(SCREEN_WIDTH);
    }];
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.dataTableView.separatorColor = [CommonTools changeColor:@"0xcccccc"];
    NSString *cellClassName = NSStringFromClass([VMFinishedTableViewCell class]);
    [self tableRegisterNibName:cellClassName cellReuseIdentifier:cellClassName estimatedRowHeight:218.5];
}
- (IBAction)beginSearchAction:(UIButton *)sender {
}

#pragma mark tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMFinishedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMFinishedTableViewCell"];
    return cell;
}

- (void)requestData{
    [SVProgressHUD showWithStatus:@"加载中..."];
    if([self.dataTableView.mj_header isRefreshing]){
        [self.dataTableView.mj_header endRefreshing];
    }else{
        [self.dataTableView.mj_footer endRefreshing];
    }
    if(self.listType == VMFinishedTableViewTypeFinished){
        VMGetFinishedOrderListAPI *getFinishedListAPI = [[VMGetFinishedOrderListAPI alloc] init];
        [getFinishedListAPI startRequestWithDicSuccess:^(NSDictionary *responseDic) {
            
        } failModel:^(VMResponseModel *errorModel) {
            [SVProgressHUD showErrorWithStatus:errorModel.msg];
        } fail:^(YTKBaseRequest *request) {
            [SVProgressHUD showErrorWithStatus:@"列表数据获取失败"];
        }];
    }else{
        VMGetFinishedOrderCancleListAPI *getCancleListAPI = [[VMGetFinishedOrderCancleListAPI alloc] init];
        [getCancleListAPI startRequestWithDicSuccess:^(NSDictionary *responseDic) {
            
        } failModel:^(VMResponseModel *errorModel) {
            [SVProgressHUD showErrorWithStatus:errorModel.msg];
        } fail:^(YTKBaseRequest *request) {
            [SVProgressHUD showErrorWithStatus:@"列表数据获取失败"];
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
