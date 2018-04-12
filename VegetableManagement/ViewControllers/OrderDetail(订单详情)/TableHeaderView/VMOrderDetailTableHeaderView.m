//
//  VMOrderDetailTableHeaderView.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMOrderDetailTableHeaderView.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface VMOrderDetailTableHeaderView()

@property (weak, nonatomic) IBOutlet UIView *headMapView;

@end

@implementation VMOrderDetailTableHeaderView
- (void)awakeFromNib{
    [super awakeFromNib];
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 265)];
    mapView.showsScale = NO; //NO表示不显示比例尺
    mapView.showsCompass = NO; //表示关闭指南针
    mapView.rotateCameraEnabled = NO;// 禁用倾斜手势
    mapView.showsUserLocation = YES;
    mapView.userTrackingMode = MAUserTrackingModeFollow;
    [_headMapView addSubview:mapView];
}

@end
