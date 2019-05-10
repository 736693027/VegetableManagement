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

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"lgoinUserId" : @"id"};
//}

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
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([VMLoginUserInfoModel class], &count);
        for(int i=0;i<count;i++){
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [[self valueForKey:key] copyWithZone:zone];
            [newModel setValue:value forKey:key];
        }
        free(ivars);
    }
    return newModel;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([VMLoginUserInfoModel class], &count);
        for(int i=0;i<count;i++){
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [self valueForKey:key];
            [aDecoder setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([VMLoginUserInfoModel class], &count);
    for(int i=0;i<count;i++){
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}
@end
