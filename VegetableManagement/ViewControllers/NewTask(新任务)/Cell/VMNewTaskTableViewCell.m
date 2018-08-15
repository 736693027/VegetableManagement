//
//  VMNewTaskTableViewCell.m
//  VegetableManagement
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMNewTaskTableViewCell.h"
#import "VMNewTaskItemModel.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "VMAcceptOrdersAPI.h"

@interface VMNewTaskTableViewCell()<AMapSearchDelegate>

@property (strong, nonatomic) AMapSearchAPI *search;
@end

@implementation VMNewTaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
}

- (void)setItemModel:(VMNewTaskItemModel *)itemModel{
    _itemModel = itemModel;
    self.dateTimeLabel.text = itemModel.lastEndTime;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",itemModel.estimatedAmount];
    self.pickupPlaceLabel.text = itemModel.storeName;
    self.pickupAddressLabel.text = itemModel.storeOther;
    self.deliveryAddressLabel.text = itemModel.userOther;
    self.pickupDistanceLabel.text = [itemModel getStoreDistance];
    self.deliveryDistanceLabel.text = [itemModel getDestinationDistance];
}
- (IBAction)creatNewOrderBtnClick:(UIButton *)sender {
    [SVProgressHUD show];
    VMAcceptOrdersAPI *acceptOrderRequest = [[VMAcceptOrdersAPI alloc] initWithOrderId:self.itemModel.orderId];
    @weakify(self)
    [acceptOrderRequest startRequestWithDicSuccess:^(NSDictionary *responseDic) {
        @strongify(self)
        [SVProgressHUD showInfoWithStatus:@"抢单成功"];
        if(self.acceptOrderSubject){
            [self.acceptOrderSubject sendNext:@1];
        }
    } failModel:^(VMResponseModel *errorModel) {
        [SVProgressHUD showErrorWithStatus:errorModel.msg];
    } fail:^(YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"抢单失败"];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)drawRect:(CGRect)rect { // 可以通过 setNeedsDisplay 方法调用 drawRect:
    // Drawing code
    CGContextRef context =UIGraphicsGetCurrentContext();
    // 设置线条的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 绘制线的宽度
    CGContextSetLineWidth(context, 0.5);
    // 线的颜色
    CGContextSetStrokeColorWithColor(context, [CommonTools changeColor:@"0xcccccc"].CGColor);
    // 开始绘制
    CGContextBeginPath(context);
    // 设置虚线绘制起点
    CGContextMoveToPoint(context, 25.0, 70.0);
    // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
    CGFloat lengths[] = {5,2};
    // 虚线的起始点
    CGContextSetLineDash(context, 0, lengths,2);
    // 绘制虚线的终点
    CGContextAddLineToPoint(context, 25.0,_deliveryDistanceLabel.frame.origin.y-8);
    // 绘制
    CGContextStrokePath(context);

}

@end
