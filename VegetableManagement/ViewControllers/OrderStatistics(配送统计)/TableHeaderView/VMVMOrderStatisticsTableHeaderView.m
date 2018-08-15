//
//  VMVMOrderStatisticsTableHeaderView.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMVMOrderStatisticsTableHeaderView.h"
#import "VMDatePicker.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface VMVMOrderStatisticsTableHeaderView()

@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIButton *startDateBtn;
@property (weak, nonatomic) IBOutlet UIButton *endDateBtn;

@property (copy ,nonatomic) NSString *startDate;
@property (copy ,nonatomic) NSString *endDate;

@end

@implementation VMVMOrderStatisticsTableHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.searchBtn.layer.borderWidth = 0.5;
    self.searchBtn.layer.borderColor = [CommonTools changeColor:@"0x999999"].CGColor;
    self.searchBtn.layer.cornerRadius = 2.5;
}

- (IBAction)searchBtnClick:(UIButton *)sender {
    if(self.resltSubject&&self.startDate.length>0&&self.endDate.length>0){
        NSDictionary *result = @{@"startTime":self.startDate,
                                 @"endTime":self.endDate
                                 };
        [self.resltSubject sendNext:result];
    }else if (self.startDate.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请选择起始时间"];
    }else if (self.endDate.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请选择截止时间"];
    }
}

- (IBAction)startDateBtnClick:(UIButton *)sender {
    VMDatePicker *datePick = [VMDatePicker datePickerView];
    @weakify(self);
    datePick.dateSignal = [RACSubject subject];
    [datePick.dateSignal subscribeNext:^(NSString *  _Nullable dateString) {
        @strongify(self);
        if(self.endDate&&([CommonTools compareDate:dateString withOtherDate:self.endDate] == NSOrderedDescending)){
                [SVProgressHUD showErrorWithStatus:@"开始日期需小于结束日期"];
        }else{
            self.startDate = dateString;
            [self.startDateBtn setTitle:dateString forState:UIControlStateNormal];
        }
    }];
    [datePick showPickerView];
}

- (IBAction)endDateBtnClick:(UIButton *)sender {
    VMDatePicker *datePick = [VMDatePicker datePickerView];
    @weakify(self);
    datePick.dateSignal = [RACSubject subject];
    [datePick.dateSignal subscribeNext:^(NSString *  _Nullable dateString) {
        @strongify(self);
        if(self.startDate&&([CommonTools compareDate:self.startDate withOtherDate:dateString] == NSOrderedDescending)){
                [SVProgressHUD showErrorWithStatus:@"结束日期需大于开始日期"];
            
        }else{
            self.endDate = dateString;
            [self.endDateBtn setTitle:dateString forState:UIControlStateNormal];
        }
    }];
    [datePick showPickerView];
}

@end
