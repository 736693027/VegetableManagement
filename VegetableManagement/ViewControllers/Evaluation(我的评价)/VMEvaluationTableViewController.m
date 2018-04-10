//
//  VMEvaluationTableViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMEvaluationTableViewController.h"
#import "VMEvaluationTableHeaderView.h"
#import <Masonry/Masonry.h>

@interface VMEvaluationTableViewController ()

@end

@implementation VMEvaluationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的评价";
    VMEvaluationTableHeaderView *headView = [[[NSBundle mainBundle] loadNibNamed:@"VMEvaluationTableHeaderView" owner:self options:nil] lastObject];
    [self.view addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(210);
    }];
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
