//
//  VMRegisterAPI.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMBaseRequest.h"

@interface VMRegisterAPI : VMBaseRequest

- (instancetype)initWithPhoneNumber:(NSString *)phoneNumber verificationCode:(NSString *)verificationCode password:(NSString *)password;

@end
