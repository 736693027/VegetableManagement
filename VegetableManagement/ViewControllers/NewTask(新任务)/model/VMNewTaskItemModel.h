//
//  VMNewTaskItemModel.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMNewTaskItemModel : NSObject

@property (nonatomic, copy) NSString *count; //总数
@property (nonatomic, copy) NSString *orderId; //订单id
@property (nonatomic, copy) NSString *finishTime;
@property (nonatomic, copy) NSString *estimatedAmount; //订单金额
@property (nonatomic, copy) NSString *actualAmount; //支付金额
@property (nonatomic, copy) NSString *storeName; //店铺名称
@property (nonatomic, copy) NSString *storeOther; //店铺详情地址
@property (nonatomic, copy) NSString *userOther; //目的地详情地址
@property (nonatomic, copy) NSString *storePhone; //商家电话
@property (nonatomic, copy) NSString *userPhone; //用户电话
@property (nonatomic, copy) NSString *ordersCount; //订单总数
@property (nonatomic, copy) NSString *ordersMoneys; //订单总金额
@property (nonatomic, copy) NSString *province; //目的地所在省、直辖市、自治区
@property (nonatomic, copy) NSString *city; //目的地所在市
@property (nonatomic, copy) NSString *township; //目的地所在区
@property (nonatomic, copy) NSString *storeProvince; //店铺所在省、直辖市、自治区
@property (nonatomic, copy) NSString *storeCity; // 店铺所在市
@property (nonatomic, copy) NSString *storeTownship; //店铺所在区、街道…
@property (nonatomic, copy) NSString *lastEndTime; //订单结束时间
@property (nonatomic, copy) NSString *storeDistance; //店铺距离当前位置的距离
@property (nonatomic, copy) NSString *destinationDistance; //目的地距离当前位置的距离

- (NSString *)getDestinationDistance;

- (NSString *)getStoreDistance;

@end
