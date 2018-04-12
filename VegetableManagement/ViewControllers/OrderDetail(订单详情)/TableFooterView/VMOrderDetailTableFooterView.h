//
//  VMOrderDetailTableFooterView.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/12.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMOrderDetailEnumFile.h"

@interface VMOrderDetailTableFooterView : UIView

@property (weak, nonatomic) IBOutlet UIButton *getBtn; //已送达/抢单
@property (weak, nonatomic) IBOutlet UIButton *reportBtn; //上报到店
@property (weak, nonatomic) IBOutlet UIButton *takeBtn; //我已取货

+ (instancetype)loadingTableFooterWithStyle:(VMOrderDetailTableFooterStyle)style;

@end
