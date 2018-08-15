//
//  VMNewTaskItemModel.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMNewTaskItemModel.h"
#import "VMSearchLocationTools.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import "VMGetLocationDistanceTools.h"
 
@implementation VMNewTaskItemModel

- (NSString *)getDestinationDistance {
    if(self.destinationDistance == nil){
        VMSearchLocationTools *showLocationTools = [VMSearchLocationTools showLocationTools];
        showLocationTools.address = self.userOther;
        showLocationTools.resultSubject = [RACSubject subject];
        @weakify(self)
        [showLocationTools.resultSubject subscribeNext:^(NSDictionary * _Nullable x) {
            @strongify(self);
            AMapGeoPoint *geoPoint = [x objectForKey:self.userOther];
            VMGetLocationDistanceTools *locationDistanceTools = [VMGetLocationDistanceTools showDistanceTools];
            [locationDistanceTools setLatitudde:geoPoint.latitude longitude:geoPoint.longitude];
            locationDistanceTools.resultSubject = [RACSubject subject];
            [locationDistanceTools.resultSubject subscribeNext:^(NSNumber * _Nullable distance) {
                self.destinationDistance = [NSString stringWithFormat:@"%.2fKM",distance.floatValue];
            }];
        }];
    }
    return self.destinationDistance;
}

- (NSString *)getStoreDistance {
    if(self.storeDistance == nil){
        VMSearchLocationTools *showLocationTools = [VMSearchLocationTools showLocationTools];
        showLocationTools.address = self.storeOther;
        showLocationTools.resultSubject = [RACSubject subject];
        @weakify(self)
        [showLocationTools.resultSubject subscribeNext:^(NSDictionary * _Nullable x) {
            @strongify(self);
            AMapGeoPoint *geoPoint = [x objectForKey:self.storeOther];
            VMGetLocationDistanceTools *locationDistanceTools = [VMGetLocationDistanceTools showDistanceTools];
            [locationDistanceTools setLatitudde:geoPoint.latitude longitude:geoPoint.longitude];
            locationDistanceTools.resultSubject = [RACSubject subject];
            [locationDistanceTools.resultSubject subscribeNext:^(NSNumber * _Nullable distance) {
                self.storeDistance = [NSString stringWithFormat:@"%.2fKM",distance.floatValue];
            }];
        }];
    }
    return self.storeDistance;
}
@end
