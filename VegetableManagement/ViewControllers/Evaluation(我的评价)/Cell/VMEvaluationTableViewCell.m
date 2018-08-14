//
//  VMEvaluationTableViewCell.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMEvaluationTableViewCell.h"
#import "VMEvaluationModel.h"

@implementation VMEvaluationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setItemModel:(VMEvaluationModel *)itemModel {
    _itemModel = itemModel;
    _senderNameLabel.text = itemModel.content;
    _contentLabel.text = itemModel.reply;
    _gradeLabel.text = itemModel.fraction;
    _dateTimeLabel.text = [CommonTools returnDateFromSecond:itemModel.createdAt];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
