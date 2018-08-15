//
//  VMMessageCenterTableViewCell.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMMessageCenterTableViewCell.h"
#import "VMMessageCenterModel.h"

@interface VMMessageCenterTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titlLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation VMMessageCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setItemModel:(VMMessageCenterModel *)itemModel{

    _itemModel = itemModel;
    self.titlLabel.text = itemModel.title;
    self.contentLabel.text = itemModel.content;
    self.dateTimeLabel.text = itemModel.createTime;
}
@end
