//
//  VMCancleOrderAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/8/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMCancleOrderAPI.h"

@implementation VMCancleOrderAPI
{
    NSString *_orderId;
}
- (instancetype)initWithOrderId:(NSString *)orderId{
    self = [super init];
    if(self){
        _orderId = orderId;
    }
    return self;
}
- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/changeCancel";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}
- (id)requestArgument {
    return @{
             @"orderId":OBJC(_orderId),
             };
}
@end
