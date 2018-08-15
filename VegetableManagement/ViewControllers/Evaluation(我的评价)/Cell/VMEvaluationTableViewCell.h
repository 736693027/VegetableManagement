//
//  VMEvaluationTableViewCell.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VMEvaluationModel;

@interface VMEvaluationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *senderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;

@property (strong, nonatomic) VMEvaluationModel *itemModel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;

@end
