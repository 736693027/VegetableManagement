//
//  VMGetMessageCenterListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetMessageCenterListAPI.h"

@implementation VMGetMessageCenterListAPI

- (NSString *)requestUrl{
    return @"/delivery/mess/noticesList";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
