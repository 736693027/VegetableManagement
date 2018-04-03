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
    return 102;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMMessageCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VMMessageCenterTableViewCell class])];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VMMessageDetailViewController *detailVC = [[VMMessageDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
