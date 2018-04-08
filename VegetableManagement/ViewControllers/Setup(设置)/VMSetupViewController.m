//
//  VMSetupViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMSetupViewController.h"
#import "VMSetupTableViewCell.h"
#import "VMSelectAgentViewController.h"

@interface VMSetupViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@property (strong, nonatomic) NSArray *titleArray;

@property (strong, nonatomic) NSArray *imageArray;

@end

@implementation VMSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
//    if (@available(iOS 11.0, *)){
//        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
//    }else{
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    _titleArray = @[@[@"我的位置",@"当前版本",@"配送区域设置"],@[@"安全退出"]];
    _imageArray = @[@[@"icon_position",@"icon_information",@"icon_region"],@[@"icon_quit"]];
    self.dataTableView.rowHeight = UITableViewAutomaticDimension;
    self.dataTableView.estimatedRowHeight = 50;
    [self.dataTableView registerNib:[UINib nibWithNibName:@"VMSetupTableViewCell" bundle:nil] forCellReuseIdentifier:@"VMSetupTableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return 3;
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMSetupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMSetupTableViewCell"];
    NSArray *tmpArray = _titleArray[indexPath.section];
    NSArray *tmpImageArray = _imageArray[indexPath.section];
    cell.titleLabel.text = tmpArray[indexPath.row];
    if(indexPath.section==1||indexPath.row == 1){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.detailLabel.text = (indexPath.section==0&&indexPath.row==1)?@"v2.2":@"";
    [cell.iconImageView setImage:[UIImage imageNamed:tmpImageArray[indexPath.row]]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        switch (indexPath.row) {
            case 0:{
                    
            }
                break;
            case 1:{
                
            }
                break;
            case 2:{
                VMSelectAgentViewController *selectAgentVC = [[VMSelectAgentViewController alloc] init];
                [self.navigationController pushViewController:selectAgentVC animated:YES];
            }
                break;
            default:
                break;
        }
    }else{
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
