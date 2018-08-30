//
//  VMHelpViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMHelpViewController.h"
#import "VMNavigationController.h"

@interface VMHelpViewController ()<UIScrollViewDelegate>{
    NSInteger currentIndex;
}

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollview;

@property (weak, nonatomic) IBOutlet UIView *indicatorView;

@end

@implementation VMHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帮助中心";
    _mainScrollview.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-self.navigationController.navigationBar.frame.size.height-55-20);
    for(NSInteger i=0;i<2;i++){
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.navigationController.navigationBar.frame.size.height-55-20)];
        if(i==0){
            view.backgroundColor = [UIColor greenColor];
        }else{
            view.backgroundColor = [UIColor yellowColor];
        }
        [_mainScrollview addSubview:view];
    }
    //禁止侧滑手势和UIScrollView同时滑动
    VMNavigationController *navContrl = (VMNavigationController *)self.navigationController;
    if([navContrl screenEdgePanGestureRecognizer]){
        //指定滑动手势在侧滑返回手势失效后响应
        [self.mainScrollview.panGestureRecognizer requireGestureRecognizerToFail:[navContrl screenEdgePanGestureRecognizer]];
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
    // Dispose of any resources that can be recreated.
}


@end
