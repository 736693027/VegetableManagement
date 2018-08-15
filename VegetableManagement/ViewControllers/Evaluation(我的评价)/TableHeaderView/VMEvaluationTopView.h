//
//  VMEvaluationTopView.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VMEvaluationTopView : UIView
@property (weak, nonatomic) IBOutlet UILabel *totalGradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *distributionSpeedGradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *serviceAttrGradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsCompleteGradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalEvaluateLabel;

@end
