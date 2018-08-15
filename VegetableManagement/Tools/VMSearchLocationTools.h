//
//  VMSearchLocationTools.h
//  VegetableManagement
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSubject;

@interface VMSearchLocationTools : NSObject

@property (copy, nonatomic) NSString *address;

@property (strong, nonatomic) RACSubject *resultSubject;

+ (VMSearchLocationTools *)showLocationTools;

@end
