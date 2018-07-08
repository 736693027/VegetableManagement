//
//  VMFinishedTableViewController.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseTableViewController.h"

typedef NS_ENUM(NSInteger ,VMFinishedTableViewType) {
    VMFinishedTableViewTypeFinished = 1,//已完成
    VMFinishedTableViewTypeCancle = 2,
};
@interface VMFinishedTableViewController : BaseTableViewController

@property (assign, nonatomic) VMFinishedTableViewType listType;
@end
