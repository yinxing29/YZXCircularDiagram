//
//  YZXCircularDiagramView.h
//  YZXCircularDiagram
//
//  Created by 尹星 on 2017/1/11.
//  Copyright © 2017年 yinixng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZXCircularDiagramView : UIView

/**
 环形中间部分颜色
 */
@property (nonatomic, strong) UIColor                    *centerViewBackgroundColor;

/**
 环形颜色
 */
@property (nonatomic, strong) UIColor                    *circularColor;

/**
 环形背景颜色
 */
@property (nonatomic, strong) UIColor                    *circularBackgroundColor;

/**
 环形的宽度
 */
@property (nonatomic, assign) CGFloat                    circularWidth;

/**
 环形中间文字大小
 */
@property (nonatomic, strong) UIFont                    *titleFont;

/**
 中间文本
 */
@property (nonatomic, strong) NSString                  *centerTitle;

/**
 字体颜色
 */
@property (nonatomic, strong) UIColor                    *titleColor;

/**
 环形展示的部分比例（范围：0.0~1.0）
 */
@property (nonatomic, assign) CGFloat                    proportion;

@end
