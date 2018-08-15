//
//  VMForgetPasswordAPI.h
//  VegetableManagement
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMBaseRequest.h"

@interface VMForgetPasswordAPI : VMBaseRequest

- (instancetype)initWithPhoneNumber:(NSString *)phoneNumber password:(NSString *)password;

@end
