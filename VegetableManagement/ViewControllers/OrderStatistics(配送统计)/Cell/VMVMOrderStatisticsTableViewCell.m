//
//  VMVMOrderStatisticsTableViewCell.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMVMOrderStatisticsTableViewCell.h"
#import "VMOrderStatisticsModel.h"

@interface VMVMOrderStatisticsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *countTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *incomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderCountLabel;

@end

@implementation VMVMOrderStatisticsTableViewCell

- (void)setItemModel:(VMOrderStatisticsModel *)itemModel index:(NSInteger)index isSearchResult:(BOOL)state{
    if(state){
        self.titleLabel.text = @"总收入";
        self.incomeLabel.text = itemModel.dateMoney;
        self.orderCountLabel.text = itemModel.dateCount;
    }else{
        switch (index) {
            case 0:
            {
                self.titleLabel.text = @"今日收入";
                self.incomeLabel.text = itemModel.todayMoney;
                self.orderCountLabel.text = itemModel.todayCount;
            }
                break;
            case 1:
            {
                self.titleLabel.text = @"7日收入";
                self.incomeLabel.text = itemModel.sevenMoney;
                self.orderCountLabel.text = itemModel.sevenCount;
            }
                break;
            case 2:
            {
                self.titleLabel.text = @"30日收入";
                self.incomeLabel.text = itemModel.thirtyMoney;
                self.orderCountLabel.text = itemModel.thirtyCount;
            }
                break;
                
            default:
                break;
        }
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
