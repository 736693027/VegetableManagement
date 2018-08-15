//
//  VMGetLocationDistanceTools.m
//  VegetableManagement
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetLocationDistanceTools.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import "VMGetUserLocation.h"

@interface VMGetLocationDistanceTools()<AMapSearchDelegate>

@property (strong, nonatomic) AMapSearchAPI *search;

@end

@implementation VMGetLocationDistanceTools

+ (VMGetLocationDistanceTools *)showDistanceTools {
    static VMGetLocationDistanceTools *distanceTools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        distanceTools = [[VMGetLocationDistanceTools alloc] init];
    });
    return distanceTools;
}
- (instancetype)init{
    self = [super init];
    if(self){
        self.search = [[AMapSearchAPI alloc] init];
        self.search.delegate = self;
    }
    return self;
}

- (void)setLatitudde:(double)latitude longitude:(double)longitude{
    VMGetUserLocation *userLocation = [VMGetUserLocation showUserLocation];
    if(userLocation.longitude>0&&userLocation.latitude>0){
        AMapDistanceSearchRequest *request = [[AMapDistanceSearchRequest alloc] init];
        request.origins = @[
                            [AMapGeoPoint locationWithLatitude:userLocation.latitude longitude:userLocation.longitude]];
        
        request.destination = [AMapGeoPoint locationWithLatitude:latitude longitude:longitude];
        request.type = 1;
        [self.search AMapDistanceSearch:request];
    }else{
        userLocation.locationResult = [RACSubject subject];
        [userLocation.locationResult subscribeNext:^(id  _Nullable x) {
            AMapDistanceSearchRequest *request = [[AMapDistanceSearchRequest alloc] init];
            request.origins = @[
                                [AMapGeoPoint locationWithLatitude:userLocation.latitude longitude:userLocation.longitude]];
            
            request.destination = [AMapGeoPoint locationWithLatitude:latitude longitude:longitude];
            request.type = 1;
            [self.search AMapDistanceSearch:request];
        }];
    }
}
- (void)onDistanceSearchDone:(AMapDistanceSearchRequest *)request response:(AMapDistanceSearchResponse *)response{
    if(response.results.count == 0){
        return;
    }
    AMapDistanceResult *result = [response.results objectAtIndex:0];
    if(self.resultSubject){
        [self.resultSubject sendNext:@(result.distance/1000)];
    }
}
@end
