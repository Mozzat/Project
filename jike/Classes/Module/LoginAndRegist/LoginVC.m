//
//  LoginVC.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/28.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "LoginVC.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLocationUI];
    
}

///隐藏导航栏
- (BOOL)fd_prefersNavigationBarHidden{
    
    return YES;
    
}

#pragma mark---设置本地UI
- (void)setLocationUI{
    
    UIButton *backBtn = [[UIButton alloc]init];
    backBtn.backgroundColor = blackColor();
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(60);
        make.right.equalTo(self.view).offset(-20);
        make.width.height.mas_equalTo(20);
        
    }];
    
    UIImageView *iconImageV = [[UIImageView alloc]init];
    iconImageV.image = [UIImage imageNamed:@"iconText"];
    [self.view addSubview:iconImageV];
    
    [iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(80);
        make.centerX.equalTo(self.view);
        
    }];
    
    UITextField *phoneText = [[UITextField alloc]init];
    phoneText.placeholder = @"手机号";
    phoneText.textColor = blackColor();
    phoneText.font = Font14();
    [self.view addSubview:phoneText];
    
    [phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(iconImageV.mas_bottom).offset(40);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(30);
        
    }];
    
    UITextField *pwdText = [[UITextField alloc]init];
    pwdText.placeholder = @"密码";
    pwdText.textColor = blackColor();
    pwdText.font = Font14();
    [self.view addSubview:pwdText];
    
    [pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(phoneText.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(30);
        
    }];
    
    UIButton *sureBtn = [[UIButton alloc]init];
    [sureBtn setTitle:@"登录" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = Font14();
    [sureBtn setTitleColor:whiteColor() forState:UIControlStateNormal];
    [sureBtn setBackgroundColor:blackColor()];
    [self.view addSubview:sureBtn];
    
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(pwdText.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(30);
        
    }];
    
}

#pragma mark---点击事件
- (void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
