//
//  ChildProductVC.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/24.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ChildProductVC.h"
#import "ProductAdCell.h"
#import "LineFlowLayout.h"
#import "ProductDetialVC.h"

@interface ChildProductVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString *cellID = @"ChildProductVC";
@implementation ChildProductVC

- (instancetype)initWithChildProductType:(ChildProductType)type{
    
    if (self = [super init]) {
        
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.clearColor;
    
    [self.view addSubview:self.collectionView];

//    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:9 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//    self.collectionView.contentOffset = CGPointMake(0, SCREENH_HEIGHT * 0.5);

}

#pragma mark---设置UI

#pragma mark---懒加载
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        LineFlowLayout *flowLayout = [[LineFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH - 60, SCREEN_WIDTH - 60);
        CGFloat height = SCREENH_HEIGHT - BDTopHeight - BDTabBarHeight - 50;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = UIColor.clearColor;
//        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[ProductAdCell class] forCellWithReuseIdentifier:cellID];
        
    }
    return _collectionView;
}


#pragma mark---<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell setShow];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductDetialVC *detialVC = [[ProductDetialVC alloc]init];
//    detialVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:detialVC animated:YES];
    [self presentViewController:detialVC animated:YES completion:nil];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PeoductScrollerStrat" object:nil];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PeoductScrollerEnd" object:nil];
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
