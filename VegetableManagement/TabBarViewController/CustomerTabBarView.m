//
//  CustomerTabBarView.m
//  VegetableManagement
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CustomerTabBarView.h"

@implementation CustomerTabBarView

- (void)awakeFromNib{
    [super awakeFromNib];
    _selectIndex = 0;
}
- (void)setSelectIndex:(NSInteger)selectIndex
{
    if(selectIndex<0)
        selectIndex = 0;
    else if (selectIndex>2)
        selectIndex = 2;
    
    // 先把上次选择的item设置为可用
    UIButton *lastItem = [self viewWithTag:_selectIndex + 9990];
    lastItem.enabled = YES;
    // 再把这次选择的item设置为不可用
    UIButton *item = [self viewWithTag:selectIndex + 9990];
    item.enabled = NO;
    _selectIndex = selectIndex;
}

- (IBAction)selectItem:(UIButton *)sender
{
    // button的tag对应tabBarController的selectedIndex
    // 设置button的样式
    self.selectIndex = sender.tag - 9990;
    // 让代理来处理切换viewController的操作
    if ([self.viewDelegate respondsToSelector:@selector(msTabBarView:didSelectItemAtIndex:)]) {
        [self.viewDelegate msTabBarView:self didSelectItemAtIndex:self.selectIndex];
    }
}

- (void)setItemBridge:(NSInteger)count atIndex:(NSInteger)index{
    NSArray *titleArray = @[@"新任务",@"待取货",@"配送中"];
    if(index<0)
        index = 0;
    else if (index>2)
        index = 2;
    UIButton *btnItem = [self viewWithTag:index + 9990];
    NSString *bridgeString = [NSString stringWithFormat:@"%ld",count];
    NSString *newString;
    if(count>0){
        newString = [NSString stringWithFormat:@"%@(%@)",titleArray[index],bridgeString];
    }else{
        newString = titleArray[index];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:newString];
    NSRange range = [newString rangeOfString:bridgeString];
    [attributedString setAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} range:NSMakeRange(0, newString.length)];
    [attributedString setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:range];
    [btnItem setAttributedTitle:attributedString forState:UIControlStateDisabled];
    
    NSMutableAttributedString *attributedStringNormal = [[NSMutableAttributedString alloc] initWithString:newString];
    [attributedStringNormal setAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} range:NSMakeRange(0, newString.length)];
    [attributedStringNormal setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:range];
    [btnItem setAttributedTitle:attributedStringNormal forState:UIControlStateNormal];
}
@end
