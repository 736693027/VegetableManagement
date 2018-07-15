//
//  VMMessageCenterModel.h
//  VegetableManagement
//
//  Created by Apple on 2018/7/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMMessageCenterModel : NSObject

@property (nonatomic, copy)NSString *itemId;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *thumb;
@property (nonatomic, copy)NSString *sort;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *createdAt;
@property (nonatomic, copy)NSString *dateTime;
@property (nonatomic, copy)NSString *imageUrl;

@end
