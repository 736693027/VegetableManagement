//
//  VMSetupViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMSetupViewController.h"
#import "VMSetupTableViewCell.h"

@interface VMSetupViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@property (strong, nonatomic) NSArray *titleArray;

@end

@implementation VMSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _titleArray = @[@[@"我的位置",@"当前版本",@"代理商选择"],@[@"安全退出"]];
    self.dataTableView.rowHeight = UITableViewAutomaticDimension;
    self.dataTableView.estimatedRowHeight = 44;
    [self.dataTableView registerNib:[UINib nibWithNibName:@"VMSetupTableViewCell" bundle:nil] forCellReuseIdentifier:@"VMSetupTableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return 3;
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMSetupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMSetupTableViewCell"];
    NSArray *tmpArray = _titleArray[indexPath.section];
    cell.titleLabel.text = tmpArray[indexPath.row];
    if(indexPath.section==1||indexPath.row == 1){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.detailLabel.text = (indexPath.section==0&&indexPath.row==1)?@"v2.2":@"";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
