//
//  VMLoginUserInfoModel.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMLoginUserInfoModel.h"

@implementation VMLoginUserInfoModel

+ (instancetype)loginUsrInfoModel{
    static dispatch_once_t onceToken;
    static VMLoginUserInfoModel *loginUserInfo;
    dispatch_once(&onceToken, ^{
        loginUserInfo = [[VMLoginUserInfoModel alloc] init];
    });
    return loginUserInfo;
}
@end
