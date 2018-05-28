//
//  LineFlowLayout.m
//  jike
//
//  Created by 上海荣豫资产 on 2018/5/23.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#import "LineFlowLayout.h"

@implementation LineFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

- (void)prepareLayout{
    
    [super prepareLayout];
    
    ///水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    //    CGFloat inset = 20;
    //    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
}

/**
 * 这个方法的返回值是一个数组（数组里面存放着rect范围内所有元素的布局属性）
 * 这个数组中存放的都是UICollectionViewLayoutAttributes对象
 * 这个方法的返回值决定了rect范围内所有元素的排布（frame）*/
/**
 UICollectionViewLayoutAttributes *attrs;
 1.一个cell对应一个UICollectionViewLayoutAttributes对象
 2.UICollectionViewLayoutAttributes对象决定了cell的frame
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    // 拿到系统已经帮我们计算好的布局属性数组，然后对其进行拷贝一份，后续用这个新拷贝的数组去操作
    NSArray * originalArray   = [super layoutAttributesForElementsInRect:rect];
    NSArray * curArray = [[NSArray alloc] initWithArray:originalArray copyItems:YES];
    
    // 计算collectionView中心点的y值(这个中心点可不是屏幕的中线点哦，是整个collectionView的，所以是包含在屏幕之外的偏移量的哦)
    CGFloat centerY = self.collectionView.contentOffset.y + self.collectionView.frame.size.height * 0.75;
    
    // 拿到每一个cell的布局属性，在原有布局属性的基础上，进行调整
    for (UICollectionViewLayoutAttributes *attrs in curArray) {
        // cell的中心点y 和 collectionView最中心点的y值 的间距的绝对值
        CGFloat space = ABS(attrs.center.y - centerY);
        
        // 根据间距值 计算 cell的缩放比例
        // 间距越大，cell离屏幕中心点越远，那么缩放的scale值就小
        CGFloat scale = 1 - space / self.collectionView.frame.size.height;
        
        // 设置缩放比例
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
        CGFloat scale1 = ABS(scale);
        attrs.alpha =  scale1;
        
//        NSLog(@"%f",space);
        
    }
    
    return curArray;
}

/**
 * 当collectionView的显示范围发生改变的时候，是否需要重新刷新布局
 * 一旦重新刷新布局，就会重新调用下面的方法：
 1.prepareLayout
 2.layoutAttributesForElementsInRect:方法
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

/**
 * 这个方法的返回值，就决定了collectionView停止滚动时的偏移量
 * proposedContentOffset：原本情况下，collectionView停止滚动时最终的偏移量
 * velocity：滚动速率，通过这个参数可以了解滚动的方向
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    // 计算出停止滚动时(不是松手时)最终显示的矩形框
    CGRect rect;
    rect.origin.y = proposedContentOffset.y;
    rect.origin.x = 0;
    rect.size = self.collectionView.frame.size;
    
    // 获得系统已经帮我们计算好的布局属性数组
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // 计算collectionView最中心点的y值
    // 再啰嗦一下，这个proposedContentOffset是系统帮我们已经计算好的，当我们松手后它惯性完全停止后的偏移量
    CGFloat centerY = proposedContentOffset.y + self.collectionView.frame.size.height * 0.75;
    
    // 当完全停止滚动后，离中点Y值最近的那个cell会通过我们多给出的偏移量回到屏幕最中间
    // 存放最小的间距值
    // 先将间距赋值为最大值，这样可以保证第一次一定可以进入这个if条件，这样可以保证一定能闹到最小间距
    CGFloat minSpace = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(minSpace) > ABS(attrs.center.y - centerY)) {
            minSpace = attrs.center.y - centerY;
        }
    }
    // 修改原有的偏移量
    proposedContentOffset.y += minSpace;
    return proposedContentOffset;
}



@end
