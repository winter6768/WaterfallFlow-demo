//
//  TagWaterfallLayout.m
//  WaterfallFlow-demo
//
//  Created by 杨艳东 on 2016/12/26.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "TagWaterfallLayout.h"

@interface TagWaterfallLayout ()
//保存每一个item的attributes
@property (nonatomic, strong) NSMutableArray *attributesArray;

//保存最后一个item的frame
@property (nonatomic, assign) CGRect lastItemFrame;
@end

@implementation TagWaterfallLayout

-(NSMutableArray *)attributesArray
{
    if (!_attributesArray)
    {
        _attributesArray = [NSMutableArray new];
    }
    return _attributesArray;
}

-(void)prepareLayout
{
    [super prepareLayout];
    
    self.lastItemFrame = CGRectMake(self.sectionInset.left, self.sectionInset.top, 0, 0);
    
    //根据collectionView获取总共有多少个item
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    [self.attributesArray removeAllObjects];
    //为每一个item创建一个attributes并存入数组
    for (int i = 0; i < itemCount; i++) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attributesArray addObject:attributes];
    }
}

-(CGSize)collectionViewContentSize
{
    return CGSizeMake(0, CGRectGetMaxY(self.lastItemFrame) + self.sectionInset.bottom);
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //根据indexPath获取item的attributes
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //获取collectionView的宽度
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    
    CGFloat itemWidth = 0;
    CGFloat itemHeight = self.rowHeight;
    
    if ([self.delegate respondsToSelector:@selector(waterfallLayout:itemWidthForHeight:atIndexPath:)])
    {
        itemWidth = [self.delegate waterfallLayout:self itemWidthForHeight:itemHeight atIndexPath:indexPath];
    }
    
//    NSLog(@"%ld -- %f",(long)indexPath.item,itemWidth);

    
    CGFloat itemX = indexPath.item ? CGRectGetMaxX(self.lastItemFrame) + self.columnSpacing : self.sectionInset.left;
    CGFloat itemY = self.lastItemFrame.origin.y;
    
    if (collectionViewWidth - itemX - self.sectionInset.right < itemWidth)
    {
        itemX = self.sectionInset.left;
        itemY = CGRectGetMaxY(self.lastItemFrame) + self.rowSpacing;
    }
    
    attributes.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);
    
    self.lastItemFrame = attributes.frame;
    
    return attributes;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributesArray;
}

@end
