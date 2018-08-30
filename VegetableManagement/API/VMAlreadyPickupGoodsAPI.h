//
//  VMAlreadyPickupGoodsAPI.h
//  VegetableManagement
//
//  Created by Apple on 2018/8/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMBaseRequest.h"

@interface VMAlreadyPickupGoodsAPI : VMBaseRequest
/**
 @param orderId 订单ID
 */
- (instancetype)initWithOrderId:(NSString *)orderId;
@end
