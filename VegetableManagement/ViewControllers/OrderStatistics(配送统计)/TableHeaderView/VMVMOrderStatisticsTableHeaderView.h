//
//  VMVMOrderStatisticsTableHeaderView.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RACSubject;

@interface VMVMOrderStatisticsTableHeaderView : UIView

@property (strong, nonatomic) RACSubject *resltSubject;

@end
