//
//  VMNewTaskItemModel.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMNewTaskItemModel : NSObject

@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *finishTime;
@property (nonatomic, copy) NSString *estimatedAmount;
@property (nonatomic, copy) NSString *actualAmount;
@property (nonatomic, copy) NSString *storeName;
@property (nonatomic, copy) NSString *storeOther;
@property (nonatomic, copy) NSString *userOther;
@property (nonatomic, copy) NSString *storePhone;
@property (nonatomic, copy) NSString *userPhone;
@property (nonatomic, copy) NSString *ordersCount;
@property (nonatomic, copy) NSString *ordersMoneys;

@end
