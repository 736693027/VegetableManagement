//
//  VMFinishedTableViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMFinishedTableViewController.h"
#import "VMNewTaskTableViewCell.h"

@interface VMFinishedTableViewController ()

@end

@implementation VMFinishedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataTableView.frame = CGRectMake(0, 55, SCREEN_WIDTH, self.view.frame.size.height-50);
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.dataTableView.separatorColor = [CommonTools changeColor:@"0xcccccc"];
    NSString *cellClassName = NSStringFromClass([VMNewTaskTableViewCell class]);
    [self tableRegisterNibName:cellClassName cellReuseIdentifier:cellClassName estimatedRowHeight:266];
}

#pragma mark tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMNewTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMNewTaskTableViewCell"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
