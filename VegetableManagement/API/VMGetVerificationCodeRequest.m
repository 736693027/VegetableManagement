//
//  VMGetVerificationCodeRequest.m
//  VegetableManagement
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetVerificationCodeRequest.h"

@implementation VMGetVerificationCodeRequest{
    NSString *_phoneNumber;
}

- (instancetype)initWithPhoneNumber:(NSString *)phoneNumber {
    self = [super init];
    if(self){
        _phoneNumber = phoneNumber;
    }
    return self;
}
- (NSString *)requestUrl{
    return @"/user/deliveryStaff/dyncode";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}
- (id)requestArgument {
    return @{
             @"phone" : OBJC(_phoneNumber)
             };
}

@end
