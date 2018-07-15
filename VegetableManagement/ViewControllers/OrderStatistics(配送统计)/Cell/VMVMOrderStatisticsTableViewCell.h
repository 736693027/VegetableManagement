//
//  VMVMOrderStatisticsTableViewCell.h
//  VegetableManagement
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VMOrderStatisticsModel;

@interface VMVMOrderStatisticsTableViewCell : UITableViewCell

- (void)setItemModel:(VMOrderStatisticsModel *)itemModel index:(NSInteger)index isSearchResult:(BOOL)state;
@end
