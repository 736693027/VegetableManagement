//
//  VMEvaluationModel.h
//  VegetableManagement
//
//  Created by 刘少轩 on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMEvaluationModel : NSObject

@property (copy, nonatomic) NSString *id;
@property (copy, nonatomic) NSString *orderId;
@property (copy, nonatomic) NSString *fraction;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *reply;
@property (copy, nonatomic) NSString *createdAt;
@property (copy, nonatomic) NSString *updatedAt;
@property (copy, nonatomic) NSString *distributionSpeed;
@property (copy, nonatomic) NSString *serviceAttitude;
@property (copy, nonatomic) NSString *commodityIntegrity;

@end
