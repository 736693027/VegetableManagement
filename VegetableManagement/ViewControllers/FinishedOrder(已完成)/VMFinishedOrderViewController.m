//
//  VMFinishedOrderViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMFinishedOrderViewController.h"
#import "VMFinishedTableViewController.h"

@interface VMFinishedOrderViewController ()<UIScrollViewDelegate>{
    NSInteger currentIndex;
}
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollview;

@property (weak, nonatomic) IBOutlet UIView *indicatorView;
@end

@implementation VMFinishedOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"已完成";
    _mainScrollview.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-self.navigationController.navigationBar.frame.size.height-50-20);
    for(NSInteger i=0;i<2;i++){
        VMFinishedTableViewController *finishedTable = [[VMFinishedTableViewController alloc] init];
        finishedTable.view.frame = CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.navigationController.navigationBar.frame.size.height-55-20);
        [self addChildViewController:finishedTable];
        [_mainScrollview addSubview:finishedTable.view];
    }
}
- (IBAction)buttonClick:(UIButton *)sender {
    NSInteger index = sender.tag - 100;
    if(index!=currentIndex){
        UIButton *beforeBtn = [self.view viewWithTag:currentIndex+100];
        beforeBtn.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.indicatorView.frame;
            frame.origin.x = index*(SCREEN_WIDTH/2);
            self.indicatorView.frame = frame;
        }];
        [self.mainScrollview setContentOffset:CGPointMake(index*SCREEN_WIDTH, 0) animated:YES];
        currentIndex = index;
        sender.selected = YES;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;
    if(index != currentIndex){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.indicatorView.frame;
            frame.origin.x = index*(SCREEN_WIDTH/2);
            self.indicatorView.frame = frame;
        }];
        UIButton *beforeBtn = [self.view viewWithTag:currentIndex+100];
        beforeBtn.selected = NO;
        UIButton *nextBtn = [self.view viewWithTag:index+100];
        nextBtn.selected = YES;
        currentIndex = index;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
