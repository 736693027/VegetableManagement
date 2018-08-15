//
//  VMGetFinishedOrderCancleListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetFinishedOrderCancleListAPI.h"

@implementation VMGetFinishedOrderCancleListAPI
{
    NSInteger _row;
    NSInteger _page;
}
- (instancetype)initWithPage:(NSInteger)page row:(NSInteger)row{
    self = [super init];
    if(self){
        _row = row;
        _page = page;
    }
    return self;
}
- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/cancelOrders";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}
- (id)requestArgument {
    return @{
             @"row":@(_row),
             @"page" : @(_page)
             };
}

@end
