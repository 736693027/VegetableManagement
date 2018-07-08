//
//  VMGetEvaluationListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetEvaluationListAPI.h"

@implementation VMGetEvaluationListAPI

- (NSString *)requestUrl{
    return @"/delivery/mess/commentsList";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
