//
//  VMLoginUserInfoModel.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMLoginUserInfoModel : NSObject<NSCopying>

@property (copy, nonatomic) NSString *lgoinUserId; //用户id
@property (copy, nonatomic) NSString *phone; //用户名(手机号)
@property (copy, nonatomic) NSString *username; //昵称
@property (copy, nonatomic) NSString *password; //密码
@property (copy, nonatomic) NSString *name; //真实姓名
@property (copy, nonatomic) NSString *idCard; //身份证号
@property (copy, nonatomic) NSString *avatar; //图像
@property (copy, nonatomic) NSString *billingAccount; //结算账号
@property (copy, nonatomic) NSString *commission; //佣金/单
@property (copy, nonatomic) NSString *orderAmount; // 配送数量
@property (copy, nonatomic) NSString *province; //省、直辖市、自治区(已改为汉字，直接显示即可)
@property (copy, nonatomic) NSString *city; //市(已改为汉字，直接显示即可)
@property (copy, nonatomic) NSString *township; //区、街道(已改为汉字，直接显示即可)
@property (copy, nonatomic) NSString *other; //详细地址
@property (copy, nonatomic) NSString *lat; //经度
@property (copy, nonatomic) NSString *lng; //纬度
@property (copy, nonatomic) NSString *status; //审核状态,0-未审核,1-通过审核,2-审核失败
@property (copy, nonatomic) NSString *createdAt;
@property (copy, nonatomic) NSString *updatedAt;
@property (copy, nonatomic) NSString *startState; //开工状态 0:未开工 1:已开工

+ (instancetype)loginUsrInfoModel;

- (void)clear;

@end
