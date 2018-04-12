//
//  VMOrderDetailTableFooterView.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/12.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMOrderDetailTableFooterView.h"

@implementation VMOrderDetailTableFooterView

+ (instancetype)loadingTableFooterWithStyle:(VMOrderDetailTableFooterStyle)style{
    
    VMOrderDetailTableFooterView *tableFooterView;
    
    switch (style) {
        case VMOrderDetailTableFooterStyleGetOrder:{
            tableFooterView = [[[NSBundle mainBundle] loadNibNamed:@"VMOrderDetailTableFooterViewDefault" owner:self options:nil] lastObject];
        }
            break;
        case VMOrderDetailTableFooterStyleTakeGoods:{
            tableFooterView = [[[NSBundle mainBundle] loadNibNamed:@"VMOrderDetailTableFooterViewOther" owner:self options:nil] lastObject];
            tableFooterView.reportBtn.layer.borderWidth = 0.5;
            tableFooterView.reportBtn.layer.borderColor = [CommonTools changeColor:@"0x666666"].CGColor;
        }
            break;
        case VMOrderDetailTableFooterStyleAlreadyDelivered:{
            tableFooterView = [[[NSBundle mainBundle] loadNibNamed:@"VMOrderDetailTableFooterViewDefault" owner:self options:nil] lastObject];
            [tableFooterView.getBtn setTitle:@"我已送达" forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
    tableFooterView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 73);
    return tableFooterView;
}

@end
