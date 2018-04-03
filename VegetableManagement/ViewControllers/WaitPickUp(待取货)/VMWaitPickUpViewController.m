//
//  VMWaitPickUpViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMWaitPickUpViewController.h"
#import "VMWaitPickUpTableViewCell.h"

@interface VMWaitPickUpViewController ()

@end

@implementation VMWaitPickUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航左侧按钮设置
    [navLeftBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.dataTableView.separatorColor = [UIColor greenColor];
    NSString *cellClassName = NSStringFromClass([VMWaitPickUpTableViewCell class]);
    [self tableRegisterNibName:cellClassName cellReuseIdentifier:cellClassName estimatedRowHeight:245];
}

#pragma mark nav leftBarBtn click
- (void)navLeftButtonClicked:(UIButton *)sender {
    
}

#pragma mark tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMWaitPickUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMWaitPickUpTableViewCell"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
