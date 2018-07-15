//
//  VMGetOrderStatisticsListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetOrderStatisticsListAPI.h"

@implementation VMGetOrderStatisticsListAPI{
    NSString *_startTime;
    NSString *_endTime;
}
- (instancetype)initWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
    self = [super init];
    if(self){
        _startTime = @"";
        _endTime = @"";
        if(startTime){
            _startTime = startTime;
        }
        if(endTime){
            _endTime = endTime;
        }
    }
    return self;
}

- (NSString *)requestUrl{
    return @"/delivery/mess/count";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}
- (id)requestArgument {
    return @{
             @"starttime":_startTime,
             @"endtime" : _endTime
             };
}
@end
