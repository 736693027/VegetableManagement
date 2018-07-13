//
//  VMLoginUserInfoModel.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMLoginUserInfoModel : NSObject<NSCopying>

@property (copy, nonatomic) NSString *lgoinUserId;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *idCard;
@property (copy, nonatomic) NSString *avatar;
@property (copy, nonatomic) NSString *billingAccount;
@property (copy, nonatomic) NSString *commission;
@property (copy, nonatomic) NSString *orderAmount;
@property (copy, nonatomic) NSString *province;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *township;
@property (copy, nonatomic) NSString *other;
@property (copy, nonatomic) NSString *lat;
@property (copy, nonatomic) NSString *lng;
@property (copy, nonatomic) NSString *status;
@property (copy, nonatomic) NSString *createdAt;
@property (copy, nonatomic) NSString *updatedAt;
@property (copy, nonatomic) NSString *startState;

+ (instancetype)loginUsrInfoModel;

- (void)clear;

@end
