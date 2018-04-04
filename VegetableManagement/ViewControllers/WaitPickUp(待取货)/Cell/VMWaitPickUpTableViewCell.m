//
//  VMWaitPickUpTableViewCell.m
//  VegetableManagement
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMWaitPickUpTableViewCell.h"

@implementation VMWaitPickUpTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.pickupInformationBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.pickupInformationBtn.layer.borderWidth = 1;
//    self.pickupInformationBtn.layer.cornerRadius = 2;
//    self.deliveryInformationBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.deliveryInformationBtn.layer.borderWidth = 1;
//    self.deliveryInformationBtn.layer.cornerRadius = 2;
//    self.toBusinessBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.toBusinessBtn.layer.borderWidth = 1;
//    self.toUseBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.toUseBtn.layer.borderWidth = 1;
}

- (IBAction)cellBtnClick:(UIButton *)sender {
    
    
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
    // 关闭图像
    CGContextClosePath(context);
}


@end
