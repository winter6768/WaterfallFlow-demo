//
//  TagSelectModel.h
//  WaterfallFlow-demo
//
//  Created by 杨艳东 on 2016/12/26.
//  Copyright © 2016年 winter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TagSelectModel : NSObject

/** 标签宽度 */
@property(nonatomic,assign)CGFloat tagWidth;

/** 标签内容 */
@property(nonatomic,strong)NSString *tagText;

/** 标签是否被选中 */
@property(nonatomic,assign)BOOL tagSelect;

@end
