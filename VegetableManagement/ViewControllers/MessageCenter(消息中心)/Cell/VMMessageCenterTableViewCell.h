//
//  VMMessageCenterTableViewCell.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VMMessageCenterModel;

@interface VMMessageCenterTableViewCell : UITableViewCell

@property (strong, nonatomic) VMMessageCenterModel *itemModel;
@end
