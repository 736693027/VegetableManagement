//
//  VMGetEvaluationListAPI.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMBaseRequest.h"

@interface VMGetEvaluationListAPI : VMBaseRequest

- (instancetype)initWithPage:(NSInteger)page row:(NSInteger)row;

@end
