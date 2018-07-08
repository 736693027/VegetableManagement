//
//  VMGetEvaluationInfoAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetEvaluationInfoAPI.h"

@implementation VMGetEvaluationInfoAPI

- (NSString *)requestUrl{
    return @"/delivery/mess/commentsHome";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
