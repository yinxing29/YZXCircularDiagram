//
//  ViewController.m
//  YZXCircularDiagram
//
//  Created by 尹星 on 2017/1/11.
//  Copyright © 2017年 yinixng. All rights reserved.
//

#import "ViewController.h"
#import "YZXCircularDiagramView.h"

@interface ViewController ()

@property (nonatomic, strong) YZXCircularDiagramView                    *circularDiagramView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"环形图";
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.circularDiagramView];
}

#pragma mark - 初始化
- (YZXCircularDiagramView *)circularDiagramView
{
    if (!_circularDiagramView) {
        _circularDiagramView = [[YZXCircularDiagramView alloc] initWithFrame:CGRectMake(0, 0, 220, 220)];
        _circularDiagramView.center = self.view.center;
        _circularDiagramView.backgroundColor = [UIColor clearColor];
        _circularDiagramView.circularWidth = 20.0;
        _circularDiagramView.proportion = 0.6;
        _circularDiagramView.centerViewBackgroundColor = [UIColor purpleColor];
        _circularDiagramView.circularColor = [UIColor orangeColor];
        _circularDiagramView.circularBackgroundColor = [UIColor grayColor];
        _circularDiagramView.titleFont = [UIFont systemFontOfSize:30.0];
        _circularDiagramView.titleColor = [UIColor blackColor];
    }
    return _circularDiagramView;
}

@end
