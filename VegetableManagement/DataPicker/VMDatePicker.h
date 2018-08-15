//
//  VMDatePicker.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VMDatePicker : UIView

@property (nonatomic ,strong) RACSubject *dateSignal;

+ (instancetype)datePickerView;

- (void)showPickerView;

@end
