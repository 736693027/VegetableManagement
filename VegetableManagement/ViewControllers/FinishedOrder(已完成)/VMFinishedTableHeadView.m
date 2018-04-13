//
//  VMFinishedTableHeadView.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMFinishedTableHeadView.h"
#import "VMDatePicker.h"

@interface VMFinishedTableHeadView()
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIButton *startDateBtn;
@property (weak, nonatomic) IBOutlet UIButton *endDateBtn;

@end

@implementation VMFinishedTableHeadView
- (void)awakeFromNib{
    [super awakeFromNib];
    self.searchBtn.layer.borderWidth = 0.5;
    self.searchBtn.layer.borderColor = [CommonTools changeColor:@"0x999999"].CGColor;
    self.searchBtn.layer.cornerRadius = 2.5;
}

- (IBAction)searchBtnClick:(UIButton *)sender {
    
}

- (IBAction)startDateBtnClick:(UIButton *)sender {
    VMDatePicker *datePick = [VMDatePicker datePickerView];
    @weakify(self);
    datePick.dateSignal = [RACSubject subject];
    [datePick.dateSignal subscribeNext:^(NSString *  _Nullable dateString) {
        @strongify(self);
        [self.startDateBtn setTitle:dateString forState:UIControlStateNormal];
    }];
    [datePick showPickerView];
}

- (IBAction)endDateBtnClick:(UIButton *)sender {
    VMDatePicker *datePick = [VMDatePicker datePickerView];
    datePick.dateSignal = [RACSubject subject];
    @weakify(self);
    [datePick.dateSignal subscribeNext:^(NSString *  _Nullable dateString) {
        @strongify(self);
        [self.endDateBtn setTitle:dateString forState:UIControlStateNormal];
    }];
    [datePick showPickerView];
}

@end
