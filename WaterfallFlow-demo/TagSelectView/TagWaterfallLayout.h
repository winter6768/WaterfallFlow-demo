//
//  TagWaterfallLayout.h
//  WaterfallFlow-demo
//
//  Created by 杨艳东 on 2016/12/26.
//  Copyright © 2016年 winter. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TagWaterfallLayout;

@protocol TagWaterfallDelegate <NSObject>

- (CGFloat)waterfallLayout:(TagWaterfallLayout *)waterfallLayout itemWidthForHeight:(CGFloat)itemHeight atIndexPath:(NSIndexPath *)indexPath;

@end

@interface TagWaterfallLayout : UICollectionViewLayout

/** 行高，必须设置 */
@property (nonatomic, assign) NSInteger rowHeight;

/** 列间距，默认是0 */
@property (nonatomic, assign) NSInteger columnSpacing;

/** 行间距，默认是0 */
@property (nonatomic, assign) NSInteger rowSpacing;

/** section与collectionView的间距，默认是（0，0，0，0）*/
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/** 代理，用来计算item的高度 */
@property (nonatomic, weak) id<TagWaterfallDelegate> delegate;

@end
