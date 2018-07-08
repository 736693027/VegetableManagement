//
//  VMBaseRequest.h
//  LBQuote
//
//  Created by FSLB on 16/2/29.
//  Copyright © 2016年 fengshunlubao. All rights reserved.
//

#import "YTKRequest.h"
#import "VMResponseModel.h"

@interface VMBaseRequest : YTKRequest


@property (nonatomic, copy) void(^successDicBlock)(NSDictionary *responseDic);
@property (nonatomic, copy) void(^successArrayBlock)(NSArray *responseArray);

@property (nonatomic, copy) void(^errorModelBlock)(VMResponseModel *errorModel);
@property (nonatomic, copy) void(^failBlock)(YTKBaseRequest *request);
@property (nonatomic, copy) void(^timeOut)(YTKBaseRequest *request);


//success用于返回业务成功
//error用于返回业务错误
//fail用于返回请求错误

- (void) startRequestWithDicSuccess:(void (^)(NSDictionary *responseDic))success failModel:(void (^)(VMResponseModel *errorModel))error fail:(void (^)(YTKBaseRequest *request))fail;
- (void) startRequestWithArraySuccess:(void (^)(NSArray *responseArray))success failModel:(void (^)(VMResponseModel *errorModel))error fail:(void (^)(YTKBaseRequest *request))fail;


@end
