//
//  VMGetUserLocation.h
//  VegetableManagement
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSubject;

@interface VMGetUserLocation : NSObject

@property (assign, nonatomic) CGFloat longitude;

@property (assign, nonatomic) CGFloat latitude;

@property (strong, nonatomic) RACSubject *locationResult;

+ (VMGetUserLocation *)showUserLocation;

@end
