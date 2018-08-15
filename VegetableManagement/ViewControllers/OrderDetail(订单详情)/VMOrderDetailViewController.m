//
//  VMOrderDetailViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMOrderDetailViewController.h"
#import "VMOrderDetailTableHeaderView.h"
#import "VMOrderDetailTableViewCell.h"
#import "VMOrderTotalTableViewCell.h"
#import "VMOrderTrackingTableViewCell.h"
#import "VMSectionHeaderView.h"
#import "VMOrderDetailTableFooterView.h"

@interface VMOrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@end

@implementation VMOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单详情";
    
    VMOrderDetailTableHeaderView *tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"VMOrderDetailTableHeaderView" owner:self options:nil] lastObject];
    tableHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 613);
    self.dataTableView.tableHeaderView = tableHeaderView;
    
    NSString *cellName = NSStringFromClass([VMOrderDetailTableViewCell class]);
    NSString *cellTotalName = NSStringFromClass([VMOrderTotalTableViewCell class]);
    NSString *cellTrackingName = NSStringFromClass([VMOrderTrackingTableViewCell class]);
    [self.dataTableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];
    [self.dataTableView registerNib:[UINib nibWithNibName:cellTotalName bundle:nil] forCellReuseIdentifier:cellTotalName];
    [self.dataTableView registerNib:[UINib nibWithNibName:cellTrackingName bundle:nil] forCellReuseIdentifier:cellTrackingName];
    
//    VMOrderDetailTableFooterView *tableFooterView = [VMOrderDetailTableFooterView loadingTableFooterWithStyle:self.footerStyle];
    VMOrderDetailTableFooterView *tableFooterView = [VMOrderDetailTableFooterView loadingTableFooterWithStyle:VMOrderDetailTableFooterStyleGetOrder];
    [[tableFooterView.getBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击事件");
    }];
    self.dataTableView.tableFooterView = tableFooterView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 4;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == 3){
            VMOrderTotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMOrderTotalTableViewCell"];
            return cell;
        }else{
            VMOrderDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMOrderDetailTableViewCell"];
            return cell;
        }
    }else{
        VMOrderTrackingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMOrderTrackingTableViewCell"];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == 3){
            return 117.f;
        }else{
            return 81.f;
        }
    }else{
        return 151.f;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 53.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    VMSectionHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"VMSectionHeaderView" owner:self options:nil] lastObject];
    return headerView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
