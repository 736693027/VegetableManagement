//
//  VMGetOrderStatisticsListAPI.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMBaseRequest.h"

@interface VMGetOrderStatisticsListAPI : VMBaseRequest

/**
 @param startTime 起始时间
 @param endTime 结束时间
 */
- (instancetype)initWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
@end
