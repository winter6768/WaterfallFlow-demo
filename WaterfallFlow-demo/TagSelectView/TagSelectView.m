//
//  TagSelectView.m
//  WaterfallFlow-demo
//
//  Created by 杨艳东 on 2016/12/26.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "TagSelectView.h"
#import "TagWaterfallLayout.h"
#import "TagSelectModel.h"

@interface TagSelectView ()<UICollectionViewDataSource,UICollectionViewDelegate,TagWaterfallDelegate>
{
    UICollectionView *myCollectionView;
    NSMutableArray *myDataArr;
}
@end

@implementation TagSelectView

-(void)setAllTagArray:(NSArray *)allTagArray selectTagArray:(NSArray *)selectTagArray canSelect:(BOOL)canSelect
{
    myDataArr = [NSMutableArray new];
    
    for (int i = 0; i < allTagArray.count; i++)
    {
        NSString *tagString = allTagArray[i];
        
        TagSelectModel *model = [[TagSelectModel alloc]init];
        model.tagText = tagString;
        CGSize size = [tagString boundingRectWithSize:CGSizeMake(100, 30) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:14]} context:nil].size;
        model.tagWidth = size.width + 20;
        
        model.tagSelect = [selectTagArray containsObject:tagString];
        [myDataArr addObject:model];
    }
    
    [self setupUIWithSelect:canSelect];
}

#pragma mark - UI
-(void)setupUIWithSelect:(BOOL)canSelect
{
    //    collection view
    TagWaterfallLayout *viewLayout = [[TagWaterfallLayout alloc]init];
    viewLayout.rowSpacing = 10;
    viewLayout.columnSpacing = 10;
    viewLayout.rowHeight = 30;
    viewLayout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
    viewLayout.delegate = self;
    
    myCollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:viewLayout];
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    myCollectionView.allowsSelection = canSelect;
    myCollectionView.backgroundColor = [UIColor darkGrayColor];
    [myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self addSubview:myCollectionView];
}

#pragma mark - collectionDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return myDataArr.count;
}

-(CGFloat)waterfallLayout:(TagWaterfallLayout *)waterfallLayout itemWidthForHeight:(CGFloat)itemHeight atIndexPath:(NSIndexPath *)indexPath
{
    TagSelectModel *model = myDataArr[indexPath.item];
    return model.tagWidth;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [cell.contentView viewWithTag:700];
    
    if (!label)
    {
        label = [UILabel new];
        label.tag = 700;
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.layer.cornerRadius = 15;
        label.clipsToBounds = YES;
        label.layer.borderColor = [UIColor whiteColor].CGColor;
        label.layer.borderWidth = 1;
        [cell.contentView addSubview:label];
    }
    
    if (indexPath.item == 1)
    {
        NSLog(@"%@",NSStringFromCGRect(label.frame));
        NSLog(@"%@",NSStringFromCGRect(cell.contentView.bounds));
        NSLog(@"%@",NSStringFromCGRect(cell.bounds));
    }
    label.frame = cell.bounds;

    TagSelectModel *model = myDataArr[indexPath.item];
    label.text = model.tagText;
    label.alpha = model.tagSelect ? 1 : .3;

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TagSelectModel *model = myDataArr[indexPath.item];
    model.tagSelect = !model.tagSelect;
    [myDataArr replaceObjectAtIndex:indexPath.item withObject:model];
    
    [myCollectionView reloadData];
    
#warning 刷新单个的时候 cell.contentView 大小会变成 上一个点击的cell  大小   会额外又一个从角落出来的动画  待解决  先用整体刷新替代
//    [myCollectionView reloadItemsAtIndexPaths:@[indexPath]];
}

@end
