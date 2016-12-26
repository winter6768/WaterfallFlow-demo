//
//  TagSelectView.h
//  WaterfallFlow-demo
//
//  Created by 杨艳东 on 2016/12/26.
//  Copyright © 2016年 winter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagSelectView : UIView

/*!
 * @param allTagArray    所有标签数组
 * @param selectTagArray 选中的标签数组
 * @param canSelect      是否可以选择
 */
-(void)setAllTagArray:(NSArray *)allTagArray selectTagArray:(NSArray *)selectTagArray canSelect:(BOOL)canSelect;

@end
