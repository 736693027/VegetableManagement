//
//  VMNewTaskListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMNewTaskListAPI.h"

@implementation VMNewTaskListAPI

- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/pending";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
