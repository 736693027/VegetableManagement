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
#import "VMEvaluationModel.h"

@interface VMEvaluationTableViewController ()
@property (strong ,nonatomic) VMEvaluationTopView *headView;
@end

@implementation VMEvaluationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的评价";
    self.navigationController.navigationBar.translucent = NO;
    self.headView = [[[NSBundle mainBundle] loadNibNamed:@"VMEvaluationTopView" owner:self options:nil] lastObject];
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 170);

    [self.dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.offset(0);
    }];
    [self tableRegisterNibName:@"VMEvaluationTableViewCell" cellReuseIdentifier:@"VMEvaluationTableViewCell" estimatedRowHeight:117];
    self.dataTableView.tableHeaderView = self.headView;
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMEvaluationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMEvaluationTableViewCell"];
    VMEvaluationModel *itemModel = [self.dataArray objectAtIndex:indexPath.row];
    cell.itemModel = itemModel;
    return cell;
}
- (void)requestData{
    [SVProgressHUD showWithStatus:@"加载中..."];
    VMGetEvaluationListAPI *getListData = [[VMGetEvaluationListAPI alloc] initWithPage:self.pageNumber row:10];
    [getListData startRequestWithDicSuccess:^(NSDictionary *responseDic) {
        [SVProgressHUD dismiss];
        if(self.pageNumber == 1){
            [self.dataArray removeAllObjects];
        }
        NSArray *jsonArray = [[responseDic objectForKey:@"list"] objectForKey:@"list"];
        NSArray *itemsArray = [NSArray yy_modelArrayWithClass:[VMEvaluationModel class] json:jsonArray];
        [self.dataArray addObject:itemsArray];
        NSDictionary *evaluationsDict = [responseDic objectForKey:@"evaluationsVo"];
        NSString *comprehensive = [NSString stringWithFormat:@"%@",[evaluationsDict objectForKey:@"comprehensive"]];
        self.headView.totalGradeLabel.text = OBJC(comprehensive);
        NSString *distributionSpeed = [NSString stringWithFormat:@"%@",[evaluationsDict objectForKey:@"distributionSpeed"]];
        self.headView.distributionSpeedGradeLabel.text = OBJC(distributionSpeed);
        NSString *serviceAttr = [NSString stringWithFormat:@"%@",[evaluationsDict objectForKey:@"serviceAttr"]];
        self.headView.serviceAttrGradeLabel.text = OBJC(serviceAttr);
        NSString *goodsComplete = [NSString stringWithFormat:@"%@",[evaluationsDict objectForKey:@"goodsComplete"]];
        self.headView.goodsCompleteGradeLabel.text = OBJC(goodsComplete);
        NSString *count = [NSString stringWithFormat:@"%@",[evaluationsDict objectForKey:@"count"]];
        self.headView.totalGradeLabel.text = OBJC(count);
        [self.dataTableView reloadData];
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.msg];
    } fail:^(YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
