//
//  VMSelectAgentViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMSelectAgentViewController.h"
#import "VMSelectAgentViewTableViewCell.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>

@interface VMSelectAgentViewController ()
@property (strong, nonatomic) NSArray *cellTitleArray;
@property (strong, nonatomic) NSArray *cellPlaceholderArray;
@end

@implementation VMSelectAgentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"代理商选择";
    _cellTitleArray = @[@"所在城市：",@"所在地区：",@"所在街道："];
    _cellPlaceholderArray = @[@"省份",@"区、县、旗、镇",@"点击选择"];
    self.dataTableView.mj_header = nil;
    self.dataTableView.mj_footer = nil;
    self.dataTableView.separatorColor = [CommonTools changeColor:@"0xcccccc"];
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    NSString *cellClassName = NSStringFromClass([VMSelectAgentViewTableViewCell class]);
    [self tableRegisterNibName:cellClassName cellReuseIdentifier:cellClassName estimatedRowHeight:55];
    [self creatTableFooterView];
}
- (void)creatTableFooterView{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55)];
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveBtn.layer.cornerRadius = 2.5;
    saveBtn.backgroundColor = [CommonTools changeColor:@"0x25ca86"];
    [footerView addSubview:saveBtn];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.offset(15);
        make.bottom.offset(0.3);
    }];
    [[saveBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击了");
    }];
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [CommonTools changeColor:@"0xcccccc"];
    [footerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.offset(0);
        make.left.offset(10);
        make.height.offset(0.3);
    }];
    self.dataTableView.tableFooterView = footerView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VMSelectAgentViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VMSelectAgentViewTableViewCell"];
    cell.titleLabel.text = _cellTitleArray[indexPath.row];
    cell.contentLabel.placeholder = _cellPlaceholderArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
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
