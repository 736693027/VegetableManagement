//
//  VMRegisterViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/7/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMRegisterViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface VMRegisterViewController ()
@property (assign, nonatomic) NSInteger time;
@property (strong, nonatomic) RACDisposable *dispoable;
@property (assign, nonatomic) IBOutlet UIButton * registerButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *VerificationCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation VMRegisterViewController

- (void)navLeftButtonClicked:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.time = 60;
    self.title = @"注册";
}
- (IBAction)getVerificationCode:(UIButton *)sender {
    sender.enabled = NO;
    @weakify(self)
    self.dispoable = [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
        @strongify(self)
        self.time --;
        NSString *titleString = self.time>0 ? [NSString stringWithFormat:@"请%ld秒后重试",self.time] : @"发送验证码";
        [self.registerButton setTitle:titleString forState:UIControlStateNormal|UIControlStateDisabled];
        self.registerButton.enabled = (self.time==0) ? YES : NO;
        if(self.time == 0){
            [self.dispoable dispose];
            self.time = 60;
        }
    }];
}
- (IBAction)registerButtonClick:(UIButton *)sender {
    if(self.phoneNumberTextField.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }else if(self.VerificationCodeTextField.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }else if(self.passwordTextField.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
