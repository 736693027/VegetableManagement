//
//  VMGetMessageCenterListAPI.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMBaseRequest.h"

@interface VMGetMessageCenterListAPI : VMBaseRequest
/**
 @param page 页码 ，从1开始
 @param row 每页显示数
 */
- (instancetype)initWithPage:(NSInteger)page row:(NSInteger)row;
@end
