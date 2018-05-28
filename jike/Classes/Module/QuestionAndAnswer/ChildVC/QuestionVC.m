//
//  QuestionVC.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/28.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "QuestionVC.h"

@interface QuestionVC ()

@end

@implementation QuestionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLocationUI];
    
}

#pragma mark---设置UI
- (void)setLocationUI{
    
    UILabel *questionLab = [[UILabel alloc]init];
    questionLab.text = @"问题";
    questionLab.textColor = UIColor.blackColor;
    questionLab.font = Font14();
    [self.view addSubview:questionLab];
    
    [questionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(30);
        
    }];
    
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = @"请添加问题";
    textField.textColor = UIColor.grayColor;
    textField.font = Font14();
    textField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:textField];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(questionLab);
        make.left.equalTo(questionLab.mas_right).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(30);
        
    }];
    
    UIButton *uploadBtn = [[UIButton alloc]init];
    [uploadBtn setTitle:@"发布" forState:UIControlStateNormal];
    [uploadBtn setTitleColor:whiteColor() forState:UIControlStateNormal];
    uploadBtn.titleLabel.font =Font12();
    uploadBtn.backgroundColor = blackColor();
    [uploadBtn rounded:5];
    [self.view addSubview:uploadBtn];
    
    [uploadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(textField.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
        
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
