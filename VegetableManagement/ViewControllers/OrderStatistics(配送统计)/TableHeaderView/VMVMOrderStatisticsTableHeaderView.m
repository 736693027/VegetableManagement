//
//  VMVMOrderStatisticsTableHeaderView.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMVMOrderStatisticsTableHeaderView.h"

@interface VMVMOrderStatisticsTableHeaderView()

@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIButton *startDateBtn;
@property (weak, nonatomic) IBOutlet UIButton *endDateBtn;

@end

@implementation VMVMOrderStatisticsTableHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.searchBtn.layer.borderWidth = 0.5;
    self.searchBtn.layer.borderColor = [CommonTools changeColor:@"0x999999"].CGColor;
    self.searchBtn.layer.cornerRadius = 2.5;
}

- (IBAction)searchBtnClick:(UIButton *)sender {
    
}

- (IBAction)startDateBtnClick:(UIButton *)sender {
    
}

- (IBAction)endDateBtnClick:(UIButton *)sender {
    
}

@end
