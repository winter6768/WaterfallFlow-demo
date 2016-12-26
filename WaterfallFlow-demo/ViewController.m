//
//  ViewController.m
//  WaterfallFlow-demo
//
//  Created by 杨艳东 on 2016/12/24.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "ViewController.h"
#import "TagSelectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arrTag = @[@"标签",@"标签",@"标签标签",@"标签标签标签",@"标签",@"标签标签标签",@"标签",@"标签标签",@"标签标签标签",@"标签",@"标签标签标签",@"标签",@"标签标签",@"标签标签标签",@"标签",@"标签标签标签",@"标签",@"标签标签",@"标签标签标签",@"标签",@"标签标签标签"];
    NSArray *arrselect = @[@"标签"];
    
    TagSelectView *tagView = [[TagSelectView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [tagView setAllTagArray:arrTag selectTagArray:arrselect canSelect:YES];
    [self.view addSubview:tagView];
}
@end
