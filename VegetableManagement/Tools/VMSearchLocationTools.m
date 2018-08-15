//
//  VMSearchLocationTools.m
//  VegetableManagement
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMSearchLocationTools.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

@interface VMSearchLocationTools()<AMapSearchDelegate>

@property (strong, nonatomic) AMapSearchAPI *search;

@end

@implementation VMSearchLocationTools

+ (VMSearchLocationTools *)showLocationTools {
    static VMSearchLocationTools *locationTools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationTools = [[VMSearchLocationTools alloc] init];
    });
    return locationTools;
}
- (instancetype)init{
    self = [super init];
    if(self){
        self.search = [[AMapSearchAPI alloc] init];
        self.search.delegate = self;
    }
    return self;
}
- (void)setAddress:(NSString *)address {
    _address = address;
    AMapGeocodeSearchRequest *geo = [[AMapGeocodeSearchRequest alloc] init];
    geo.address = address;
    [self.search AMapGeocodeSearch:geo];
}

- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response{
    if(response.geocodes.count == 0){
        return;
    }
    AMapGeocode *geocodeModel = [response.geocodes objectAtIndex:0];
    if(self.resultSubject){
        NSDictionary *result = [NSDictionary dictionaryWithObject:geocodeModel.location forKey:request.address];
        [self.resultSubject sendNext:result];
    }
}
@end
