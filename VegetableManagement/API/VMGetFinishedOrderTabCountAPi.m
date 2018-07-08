//
//  VMGetFinishedOrderTabCountAPi.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetFinishedOrderTabCountAPi.h"

@implementation VMGetFinishedOrderTabCountAPi

- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/finishedList";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
