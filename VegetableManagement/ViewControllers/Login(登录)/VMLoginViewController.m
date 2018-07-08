//
//  VMLoginViewController.m
//  VegetableManagement
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "VMLoginViewController.h"
#import "VMLoginRequestAPI.h"

@interface VMLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation VMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)loginButtonClick:(UIButton *)sender {
    if(self.passwordTextField.text.length>0&&self.phoneNumberTextField.text.length>0){
        VMLoginRequestAPI *loginAPI = [[VMLoginRequestAPI alloc] initWithUsername:self.phoneNumberTextField.text password:self.passwordTextField.text];
        [loginAPI startRequestWithDicSuccess:^(NSDictionary *responseDic) {
            
        } failModel:^(VMResponseModel *errorModel) {
            
        } fail:^(YTKBaseRequest *request) {
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
