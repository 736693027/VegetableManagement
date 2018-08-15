//
//  VMMessageDetailViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMMessageDetailViewController.h"
#import "VMMessageCenterModel.h"

@interface VMMessageDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation VMMessageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    self.titleLabel.text = self.itemModel.title;
    self.dateTimeLabel.text = self.itemModel.createTime;
    self.contentLabel.text = self.itemModel.content;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
