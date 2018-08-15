//
//  VMGetUserLocation.m
//  VegetableManagement
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetUserLocation.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import <ReactiveObjc/ReactiveObjC.h>

@interface VMGetUserLocation()<AMapLocationManagerDelegate>

@property (strong ,nonatomic) AMapLocationManager *locationManager;
@end

@implementation VMGetUserLocation

+ (VMGetUserLocation *)showUserLocation {
    static VMGetUserLocation *userLocation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userLocation = [[VMGetUserLocation alloc] init];
    });
    return userLocation;
}

- (instancetype)init {
    self = [super init];
    if(self){
        self.locationManager = [[AMapLocationManager alloc] init];
        
        [self.locationManager setDelegate:self];
        
        [self.locationManager setPausesLocationUpdatesAutomatically:NO];
        
        [self.locationManager setAllowsBackgroundLocationUpdates:YES];
        //开始定位
        [self.locationManager startUpdatingLocation];
    }
    return self;
}

- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
    //定位错误
    NSLog(@"%s, amapLocationManager = %@, error = %@", __func__, [manager class], error);
}

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    //定位结果
    self.latitude = location.coordinate.latitude;
    self.longitude = location.coordinate.longitude;
    if(self.locationResult){
        [self.locationResult sendNext:@"定位成功"];
    }
}
@end
