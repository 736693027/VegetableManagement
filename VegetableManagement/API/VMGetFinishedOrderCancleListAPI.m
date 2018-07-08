//
//  VMGetFinishedOrderCancleListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetFinishedOrderCancleListAPI.h"

@implementation VMGetFinishedOrderCancleListAPI

- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/cancelOrders";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
