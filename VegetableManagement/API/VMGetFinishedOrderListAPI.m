//
//  VMGetFinishedOrderListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetFinishedOrderListAPI.h"

@implementation VMGetFinishedOrderListAPI

- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/finishOrders";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
