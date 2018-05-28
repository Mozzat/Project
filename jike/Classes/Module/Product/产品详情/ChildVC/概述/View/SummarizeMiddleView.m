//
//  SummarizeMiddleView.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/27.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "SummarizeMiddleView.h"

@interface SummarizeMiddleView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString *cellID = @"SummarizeMiddleView";
@implementation SummarizeMiddleView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        UILabel *titleLab = [[UILabel alloc]init];
        titleLab.text = @"图集";
        titleLab.font = Font16();
        titleLab.textColor = UIColor.blackColor;
        [self addSubview:titleLab];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(20);
            
        }];
        
        [self addSubview:self.collectionView];
    }
    return self;
}

- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 120);
        layout.minimumInteritemSpacing = 20;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH , 120) collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColor.whiteColor;
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[SummarizeCollectionCell class] forCellWithReuseIdentifier:cellID];
    }
    return _collectionView;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SummarizeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
    
}

@end

@implementation SummarizeCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = UIColor.blackColor;
        
        [self.contentView addSubview:self.productImageV];
        [self.productImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.left.with.height.equalTo(self.contentView);
            
        }];
        
    }
    return self;
}


#pragma mark---懒加载
- (UIImageView *)productImageV{
    
    if (!_productImageV) {
        _productImageV = [[UIImageView alloc]init];
        _productImageV.contentMode = UIViewContentModeScaleToFill;
        _productImageV.clipsToBounds = YES;
//        _productImageV.image = [UIImage imageNamed:@"product_BgImage"];
        
    }
    return _productImageV;
}

@end

