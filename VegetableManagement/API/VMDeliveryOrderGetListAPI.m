


//
//  VMDeliveryOrderGetListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMDeliveryOrderGetListAPI.h"

@implementation VMDeliveryOrderGetListAPI

- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/distribution";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
