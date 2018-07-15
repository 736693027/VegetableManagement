//
//  VMMessageCenterModel.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMMessageCenterModel.h"

@implementation VMMessageCenterModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"itemId" : @"id"};
    
}
- (NSString *)dateTime{
    _dateTime = @"";
    if(self.createdAt){
        _dateTime = [CommonTools returnDateFromSecond:self.createdAt];
    }
    return _dateTime;
}
- (NSString *)imageUrl{
    _imageUrl = @"";
    if(self.thumb){
        _imageUrl = [NSString stringWithFormat:@"%@/%@",BASEURL,self.thumb];
    }
    return _imageUrl;
}
@end
