//
//  VMResponseModel.m
//  LBAssistant
//
//  Created by WangKeke on 16/4/28.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#import "VMResponseModel.h"

@implementation VMResponseModel

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    id data = dic[@"result"];
    if (data) {
        self.result =  [data yy_modelToJSONString];
    }
    
    return YES;
}

@end
