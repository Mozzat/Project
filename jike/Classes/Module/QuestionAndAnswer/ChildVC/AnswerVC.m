
//
//  AnswerVC.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/28.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "AnswerVC.h"

@interface AnswerVC ()

@property (nonatomic, strong) UILabel *questionContentLab;

@property (nonatomic, strong) UITextView *textView;

@end

@implementation AnswerVC

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
        
    }];
    
    self.questionContentLab = [[UILabel alloc]init];
    self.questionContentLab.textColor = UIColor.grayColor;
    self.questionContentLab.text = @"美团机器人可以送外卖么？";
    self.questionContentLab.font = Font14();
    [self.view addSubview:self.questionContentLab];
    
    [self.questionContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(questionLab.mas_right).offset(30);
        
    }];
    
    self.textView = [[UITextView alloc]init];
    self.textView.font = Font14();
    self.textView.textColor = UIColor.grayColor;
    [self.textView rounded:5 width:0.5 color:UIColor.grayColor];
    [self.view addSubview:self.textView];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.questionContentLab.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(150);
        
    }];
    
    UIButton *uploadBtn = [[UIButton alloc]init];
    [uploadBtn setTitle:@"发布" forState:UIControlStateNormal];
    [uploadBtn setTitleColor:whiteColor() forState:UIControlStateNormal];
    uploadBtn.titleLabel.font =Font12();
    uploadBtn.backgroundColor = blackColor();
    [uploadBtn rounded:5];
    [self.view addSubview:uploadBtn];
    
    [uploadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.textView.mas_bottom).offset(20);
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
