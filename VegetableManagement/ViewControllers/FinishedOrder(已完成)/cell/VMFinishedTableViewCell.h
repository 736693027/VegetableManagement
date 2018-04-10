//
//  VMFinishedTableViewCell.h
//  VegetableManagement
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VMFinishedTableViewCell : UITableViewCell

//取货信息
@property (weak, nonatomic) IBOutlet UIButton *pickupInformationBtn;
//送货信息
@property (weak, nonatomic) IBOutlet UIButton *deliveryInformationBtn;
//价格
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
//日期
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;
//取货距离
@property (weak, nonatomic) IBOutlet UILabel *pickupDistanceLabel;
//取货的地方
@property (weak, nonatomic) IBOutlet UILabel *pickupPlaceLabel;
//取货的地址
@property (weak, nonatomic) IBOutlet UILabel *pickupAddressLabel;
//送货的距离
@property (weak, nonatomic) IBOutlet UILabel *deliveryDistanceLabel;
//送货的地址
@property (weak, nonatomic) IBOutlet UILabel *deliveryAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;

@end
