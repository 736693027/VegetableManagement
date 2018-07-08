//
//  VMEvaluationTopView.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMEvaluationTopView.h"
#import "XHStarRateView.h"
#import <Masonry/Masonry.h>
#import "VMGetEvaluationInfoAPI.h"

@interface VMEvaluationTopView()
@property (weak, nonatomic) IBOutlet UIView *distributionView;
@property (weak, nonatomic) IBOutlet UIView *serviceView;
@property (weak, nonatomic) IBOutlet UIView *commodityView;

@end

@implementation VMEvaluationTopView

- (void)awakeFromNib{
    [super awakeFromNib];
    XHStarRateView *starRateView = [[XHStarRateView alloc] initWithFrame:CGRectMake(20, 180, 200, 30) numberOfStars:5 rateStyle:IncompleteStar isAnination:YES finish:^(CGFloat currentScore) {
    }];
    [self.distributionView addSubview:starRateView];
    [starRateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.left.offset(0);
    }];
    
    XHStarRateView *starRateView1 = [[XHStarRateView alloc] initWithFrame:CGRectMake(20, 180, 200, 30) numberOfStars:5 rateStyle:IncompleteStar isAnination:YES finish:^(CGFloat currentScore) {
    }];
    [starRateView1 setProgress:3.5];
    [self.serviceView addSubview:starRateView1];
    [starRateView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.left.offset(0);
    }];
    
    XHStarRateView *starRateView2 = [[XHStarRateView alloc] initWithFrame:CGRectMake(20, 180, 200, 30) numberOfStars:5 rateStyle:IncompleteStar isAnination:YES finish:^(CGFloat currentScore) {
    }];
    [self.commodityView addSubview:starRateView2];
    [starRateView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.left.offset(0);
    }];
    
    VMGetEvaluationInfoAPI *getEvaluationAPI = [[VMGetEvaluationInfoAPI alloc] init];
    [getEvaluationAPI startRequestWithDicSuccess:^(NSDictionary *responseDic) {
        
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.message];
    } fail:^(YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"评价信息获取失败"];
    }];
}
@end
