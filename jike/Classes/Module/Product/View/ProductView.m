//
//  ProductView.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/22.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "ProductView.h"
#import "ProductAdCell.h"
#import "LineFlowLayout.h"

@interface ProductView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView  *collectionView;

@end

static NSString *cellID = @"ProductViewCell";
@implementation ProductView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.collectionView];
    }
    return self;
    
}

- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        LineFlowLayout *layout = [[LineFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(self.width, self.height);
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height) collectionViewLayout:layout];
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = UIColor.clearColor;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[ProductAdCell class] forCellWithReuseIdentifier:cellID];
        
    }
    
    return _collectionView;
    
}


#pragma  mark --UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
//设置分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//设置每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.block) {
        self.block();
    }
    
}

@end
