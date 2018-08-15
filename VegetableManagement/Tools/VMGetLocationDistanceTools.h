//
//  VMGetLocationDistanceTools.h
//  VegetableManagement
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSubject;

@interface VMGetLocationDistanceTools : NSObject

@property (strong, nonatomic) RACSubject *resultSubject;

+ (VMGetLocationDistanceTools *)showDistanceTools;

- (void)setLatitudde:(double)latitude longitude:(double)longitude;
@end
