//
//  VMDatePicker.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMDatePicker.h"

@interface VMDatePicker()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong ,nonatomic) UIView *backView;
@end

@implementation VMDatePicker

+ (instancetype)datePickerView{
    VMDatePicker *datePicker = [[[NSBundle mainBundle]loadNibNamed:@"VMDatePicker" owner:self options:nil] lastObject];
    return datePicker;
}
- (void)awakeFromNib{
    [super awakeFromNib];
}
- (UIView *)backView{
    if(_backView == nil){
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _backView.backgroundColor = [UIColor blackColor];
        _backView.backgroundColor = [_backView.backgroundColor colorWithAlphaComponent:0.4];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenPickerView:)];
        [_backView addGestureRecognizer:tapGesture];
    }
    return _backView;
}
- (void)showPickerView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backView];
    self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 216);;
    [self.backView addSubview:self];
    [UIView animateWithDuration:0.35 delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT-216, SCREEN_WIDTH, 216);
    } completion:^(BOOL finished) {
        
    }];
}
- (IBAction)confirmBtnClick:(UIButton *)sender {
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:@"dd.MM.yyyy"];
    NSString *dateString = [dataFormatter stringFromDate:self.datePicker.date];
    [self.dateSignal sendNext:dateString];
    NSLog(@"-------%@---------%@",dateString,self.datePicker.date);
    [self hiddenPickerView:nil];
}

- (IBAction)hiddenPickerView:(UIButton *)sender{
    [UIView animateWithDuration:0.35 delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 216);
    } completion:^(BOOL finished) {
        [self.backView removeFromSuperview];
        self.backView = nil;
    }];
}
@end
