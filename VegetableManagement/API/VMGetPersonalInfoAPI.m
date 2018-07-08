//
//  VMGetPersonalInfoAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetPersonalInfoAPI.h"

@implementation VMGetPersonalInfoAPI

- (NSString *)requestUrl{
    return @"/delivery/mess/message";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
