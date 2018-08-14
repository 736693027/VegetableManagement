//
//  VMGetEvaluationListAPI.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMGetEvaluationListAPI.h"

@implementation VMGetEvaluationListAPI
{
    NSInteger _row;
    NSInteger _page;
}
- (instancetype)initWithPage:(NSInteger)page row:(NSInteger)row{
    self = [super init];
    if(self){
        _row = row;
        _page = page;
    }
    return self;
}
- (NSString *)requestUrl{
    return @"/delivery/mess/commentsList";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}
- (id)requestArgument {
    return @{
             @"row":@(_row),
             @"page" : @(_page)
             };
}
@end
