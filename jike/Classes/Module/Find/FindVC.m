//
//  FindVC.m
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "FindVC.h"
#import "ShadowView.h"
@interface FindVC ()

@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发现";
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"markus-spiske-516263-unsplash"];
//    imageView.contentMode = UIViewContentModeCenter;
//    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];

    CGFloat scale = SCREEN_WIDTH/375.0;
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view).offset(-50);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(328 * scale);

    }];
    
//    UIView *redView = [[UIView alloc]init];
//    redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:redView];
//
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.left.right.equalTo(self.view);
//        make.height.mas_equalTo(300);
//
//    }];
    
//    UIView *whiteView = [[UIView alloc]init];
//    whiteView.backgroundColor = [UIColor whiteColor];
//    whiteView.alpha = 0.98;
//    [self.view addSubview:whiteView];
//
//    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.bottom.equalTo(imageView).offset(10);
//        make.left.right.equalTo(imageView);
//        make.height.mas_equalTo(30);
//
//    }];
    
//    CAShapeLayer *shapeLaer = [CAShapeLayer layer];
//    shapeLaer.frame = whiteView.bounds;
//    shapeLaer.backgroundColor = [UIColor whiteColor].CGColor;
//    shapeLaer.shadowColor = [UIColor whiteColor].CGColor;
//    shapeLaer.shadowOffset = CGSizeMake(0, -30);
//    shapeLaer.shadowOpacity = 1;
//    shapeLaer.shadowRadius = 30;
//    [whiteView.layer addSublayer:shapeLaer];
    
//    whiteView.layer.shadowColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1].CGColor;//阴影颜色
//    whiteView.layer.shadowOffset = CGSizeMake(0, -30);//偏移距离
//    whiteView.layer.shadowOpacity = 1;//不透明度
//    whiteView.layer.shadowRadius = 5;//半径
    
    ShadowView *shadowView = [[ShadowView alloc]init];
    shadowView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:shadowView];

    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(imageView).offset(30);
        make.left.equalTo(imageView).offset(-10);
        make.width.mas_equalTo(SCREEN_WIDTH + 40);
        make.height.mas_equalTo(120);

    }];
    
    UIView *whiteView = [[UIView alloc]init];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(shadowView).offset(79);
        make.left.right.equalTo(imageView);
        make.height.mas_equalTo(5);
        
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
