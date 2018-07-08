//
//  VMGetTablCountAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetTablCountAPI.h"

@implementation VMGetTablCountAPI

- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/tbdCompletedList";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
