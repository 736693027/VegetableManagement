//
//  VMGetWaitPickUpListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetWaitPickUpListAPI.h"

@implementation VMGetWaitPickUpListAPI

- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/pickupList";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
