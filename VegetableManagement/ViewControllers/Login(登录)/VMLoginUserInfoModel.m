//
//  VMLoginUserInfoModel.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMLoginUserInfoModel.h"
#import <objc/message.h>

@implementation VMLoginUserInfoModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"lgoinUserId" : @"id"};
}

+ (instancetype)loginUsrInfoModel{
    static dispatch_once_t onceToken;
    static VMLoginUserInfoModel *loginUserInfo;
    dispatch_once(&onceToken, ^{
        loginUserInfo = [[VMLoginUserInfoModel alloc] init];
    });
    return loginUserInfo;
}
- (void)clear{
    unsigned int propertyCount = 0;
    Ivar *ivas = class_copyIvarList([self class], &propertyCount);
    for(int i=0;i<propertyCount;i++){
        Ivar ivar = ivas[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        [self setValue:nil forKey:key];
    }
}
- (id)copyWithZone:(NSZone *)zone{
    VMLoginUserInfoModel *newModel = [VMLoginUserInfoModel loginUsrInfoModel];
    if(newModel){
        newModel.lgoinUserId = [self.lgoinUserId copyWithZone:zone];
        newModel.phone = [self.phone copyWithZone:zone];
        newModel.username = [self.username copyWithZone:zone];
        newModel.password = [self.password copyWithZone:zone];
        newModel.name = [self.name copyWithZone:zone];
        newModel.idCard = [self.idCard copyWithZone:zone];
        newModel.avatar = [self.avatar copyWithZone:zone];
        newModel.billingAccount = [self.billingAccount copyWithZone:zone];
        newModel.commission = [self.commission copyWithZone:zone];
        newModel.orderAmount = [self.orderAmount copyWithZone:zone];
        newModel.province = [self.province copyWithZone:zone];
        newModel.city = [self.city copyWithZone:zone];
        newModel.township = [self.township copyWithZone:zone];
        newModel.other = [self.other copyWithZone:zone];
        newModel.lat = [self.lat copyWithZone:zone];
        newModel.lng = [self.lng copyWithZone:zone];
        newModel.status = [self.status copyWithZone:zone];
        newModel.createdAt = [self.createdAt copyWithZone:zone];
        newModel.updatedAt = [self.updatedAt copyWithZone:zone];
        newModel.startState = [self.startState copyWithZone:zone];
    }
    return newModel;
}
@end
