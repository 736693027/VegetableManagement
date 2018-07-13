//
//  VMRegisterAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMRegisterAPI.h"

@implementation VMRegisterAPI{
    NSString *_phoneNumber;
    NSString *_verificationCode;
    NSString *_password;
}

- (instancetype)initWithPhoneNumber:(NSString *)phoneNumber verificationCode:(NSString *)verificationCode password:(NSString *)password{
    self = [super init];
    if(self){
        _phoneNumber = phoneNumber;
        _verificationCode = verificationCode;
        _password = password;
    }
    return self;
}
- (NSString *)requestUrl{
    return @"/orders/deliveryStaff/cancelOrders";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}
- (id)requestArgument {
    return @{
             @"username":OBJC(_password),
             @"password" : OBJC(_phoneNumber)
             };
}
@end
