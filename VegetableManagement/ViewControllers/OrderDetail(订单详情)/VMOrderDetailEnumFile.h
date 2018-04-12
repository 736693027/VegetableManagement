//
//  VMOrderDetailEnumFile.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/12.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef VMOrderDetailEnumFile_h
#define VMOrderDetailEnumFile_h

typedef NS_ENUM(NSInteger ,VMOrderDetailTableFooterStyle) {
    VMOrderDetailTableFooterStyleGetOrder = 1, //抢单
    VMOrderDetailTableFooterStyleTakeGoods = 2, //取货
    VMOrderDetailTableFooterStyleAlreadyDelivered = 3,//已经送达
};

#endif /* VMOrderDetailEnumFile_h */
