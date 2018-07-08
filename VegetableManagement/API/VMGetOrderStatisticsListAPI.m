//
//  VMGetOrderStatisticsListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetOrderStatisticsListAPI.h"

@implementation VMGetOrderStatisticsListAPI

- (NSString *)requestUrl{
    return @"/delivery/mess/count";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
