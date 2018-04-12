//
//  VMUserLocationViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/12.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMUserLocationViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface VMUserLocationViewController ()

@end

@implementation VMUserLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的位置";
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.rotateCameraEnabled = NO;// 禁用倾斜手势
    
    [_mapView setZoomLevel:9.5 animated:YES];//地图的缩放级别
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    MAUserLocationRepresentation *locationRepresentation = [[MAUserLocationRepresentation alloc] init];
    locationRepresentation.showsAccuracyRing = YES; //不显示精度圈
//    locationRepresentation.showsHeadingIndicator = YES;//是否显示指示方向(MAUserTrackingModeFollowWithHeading模式开启)
//    locationRepresentation.fillColor = [UIColor greenColor];///精度圈 填充颜色
//    locationRepresentation.strokeColor = [UIColor blueColor];///精度圈 边线颜色
//    locationRepresentation.lineWidth = 2;//精度圈边线宽度
    locationRepresentation.enablePulseAnnimation = YES;///内部蓝色圆点是否使用律动效果, 默认YES
//    locationRepresentation.locationDotBgColor = [UIColor greenColor];///定位点背景色，不设置默认白色
//    locationRepresentation.locationDotFillColor = [UIColor grayColor];///定位点蓝色圆点颜色，不设置默认蓝色
    locationRepresentation.image = [UIImage imageNamed:@"icon_deliverID"]; ///定位图标, 与蓝色原点互斥
    [_mapView updateUserLocationRepresentation:locationRepresentation];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
