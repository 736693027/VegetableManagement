//
//  VMEvaluationTableViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMEvaluationTableViewController.h"
#import "VMEvaluationTopView.h"
#import <Masonry/Masonry.h>
#import "VMEvaluationTableViewCell.h"
#import "VMGetEvaluationListAPI.h"

@interface VMEvaluationTableViewController ()

@end

@implementation VMEvaluationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的评价";
    self.navigationController.navigationBar.translucent = NO;
    VMEvaluationTopView *headView = [[[NSBundle mainBundle] loadNibNamed:@"VMEvaluationTopView" owner:self options:nil] lastObject];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 170);

    [self.dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.offset(0);
    }];
    [self tableRegisterNibName:@"VMEvaluationTableViewCell" cellReuseIdentifier:@"VMEvaluationTableViewCell" estimatedRowHeight:117];
    self.dataTableView.tableHeaderView = headView;
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMEvaluationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMEvaluationTableViewCell"];
    return cell;
}
- (void)requestData{
    [SVProgressHUD show];
    VMGetEvaluationListAPI *getListData = [[VMGetEvaluationListAPI alloc] init];
    [getListData startRequestWithArraySuccess:^(NSArray *responseArray) {
        
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.message];
    } fail:^(YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
