//
//  MainTabBarVC.m
//  jike
//
//  Created by taotingxing on 2018/5/15.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "MainTabBarVC.h"
#import "HomeVC.h"
#import "PersonalVC.h"
#import "BaseNavigationController.h"

@interface MainTabBarVC ()

@end

@implementation MainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    self.tabBar.shadowImage = [[UIImage alloc]init];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.blackColor} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : greenColor()} forState:UIControlStateSelected];
        
    NSArray *titleArr =@[@"首页",@"产品",@"个人"];
    NSArray *vcArr = @[@"HomeVC",@"ProductVC",@"PersonalVC"];
    
    for (NSInteger index = 0; index < vcArr.count; index++) {
        
        BaseViewController *vc = [[NSClassFromString(vcArr[index]) alloc]init];
        vc.navigationItem.title = titleArr[index];
        [self setupOneChildViewController:vc title:titleArr[index] image:@"" selectedImage:@""];
        
    }
    
}

- (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

//设置子控制器
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
//    UIImage *image1 = [UIImage imageNamed:image];
    //不使用系统自带的蓝色默认图
//    image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *imageSelect = [UIImage imageNamed:selectedImage];
//    imageSelect = [imageSelect imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BaseNavigationController *na = [[BaseNavigationController alloc] initWithRootViewController:vc];
    na.tabBarItem.title = title;
//    na.tabBarItem.image = image1;
//    na.tabBarItem.selectedImage = imageSelect;
    [self addChildViewController:na];
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
