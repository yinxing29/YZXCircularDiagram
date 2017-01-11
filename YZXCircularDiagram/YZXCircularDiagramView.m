//
//  YZXCircularDiagramView.m
//  YZXCircularDiagram
//
//  Created by 尹星 on 2017/1/11.
//  Copyright © 2017年 yinixng. All rights reserved.
//

#import "YZXCircularDiagramView.h"

#define layerWidth MIN(self.bounds.size.width, self.bounds.size.height)
#define center_x self.bounds.size.width / 2.0
#define center_y self.bounds.size.height / 2.0

@interface YZXCircularDiagramView ()

@property (nonatomic, strong) CAShapeLayer                    *circularLayer;

//中间部分View
@property (nonatomic, strong) UIButton                        *centerView;

//贝塞尔曲线写圆
@property (nonatomic, strong) UIBezierPath                    *path;

@end

@implementation YZXCircularDiagramView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circularLayer.path = self.path.CGPath;
        self.circularLayer.backgroundColor = [UIColor whiteColor].CGColor;
        self.circularLayer.lineWidth = 10.0;
        self.circularLayer.strokeColor = [UIColor purpleColor].CGColor;
        self.circularLayer.fillColor = [UIColor whiteColor].CGColor;
        self.circularLayer.strokeStart = 0;
        self.circularLayer.strokeEnd = 0;
        [self.layer addSublayer:self.circularLayer];
        
        [self addSubview:self.centerView];
    }
    return self;
}

#pragma mark - setter
- (void)setCenterViewBackgroundColor:(UIColor *)centerViewBackgroundColor
{
    if (_centerViewBackgroundColor != centerViewBackgroundColor) {
        _centerViewBackgroundColor = centerViewBackgroundColor;
    }
    self.centerView.backgroundColor = _centerViewBackgroundColor;
}

- (void)setCircularColor:(UIColor *)circularColor
{
    if (_circularColor != circularColor) {
        _circularColor = circularColor;
    }
    self.circularLayer.strokeColor = _circularColor.CGColor;
}

- (void)setCircularBackgroundColor:(UIColor *)circularBackgroundColor
{
    if (_circularBackgroundColor != circularBackgroundColor) {
        _circularBackgroundColor = circularBackgroundColor;
    }
    self.circularLayer.backgroundColor = _circularBackgroundColor.CGColor;
    self.circularLayer.fillColor = _circularBackgroundColor.CGColor;
}

- (void)setTitleFont:(UIFont *)titleFont
{
    if (_titleFont != titleFont) {
        _titleFont = titleFont;
    }
    self.centerView.titleLabel.font = _titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    if (_titleColor != titleColor) {
        _titleColor = titleColor;
    }
    [self.centerView setTitleColor:_titleColor forState:UIControlStateNormal];
}

- (void)setProportion:(CGFloat)proportion
{
    if (_proportion != proportion) {
        _proportion = proportion;
    }
    self.circularLayer.strokeEnd = proportion;
}

- (void)setCircularWidth:(CGFloat)circularWidth
{
    if (_circularWidth != circularWidth) {
        _circularWidth = circularWidth;
    }
    self.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(layerWidth / 2.0, layerWidth / 2.0) radius:layerWidth / 2.0 - _circularWidth / 2.0 startAngle:-M_PI_2 endAngle:M_PI * 3.0 / 2.0 clockwise:YES];
    self.circularLayer.path = self.path.CGPath;
    self.circularLayer.lineWidth = _circularWidth;
    
    self.centerView.bounds = CGRectMake(0, 0, layerWidth - _circularWidth * 2.0, layerWidth - _circularWidth * 2.0);
    self.centerView.layer.cornerRadius = self.centerView.bounds.size.width / 2.0;
}

- (void)setCenterTitle:(NSString *)centerTitle
{
    if (_centerTitle != centerTitle) {
        _centerTitle = centerTitle;
    }
    [self.centerView setTitle:_centerTitle forState:UIControlStateNormal];
}

#pragma mark - 初始化
- (CAShapeLayer *)circularLayer
{
    if (!_circularLayer) {
        _circularLayer = [[CAShapeLayer alloc] init];
        _circularLayer.frame = CGRectMake(0, 0, layerWidth, layerWidth);
        _circularLayer.position = CGPointMake(center_x, center_y);
        _circularLayer.cornerRadius = layerWidth / 2.0;
    }
    return _circularLayer;
}

- (UIButton *)centerView
{
    if (!_centerView) {
        _centerView = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerView.bounds = CGRectMake(0, 0, layerWidth - 20.0, layerWidth - 20.0);
        _centerView.center = CGPointMake(center_x, center_y);
        [_centerView setTitle:@"中心" forState:UIControlStateNormal];
        _centerView.backgroundColor = [UIColor orangeColor];
        _centerView.layer.cornerRadius = _centerView.bounds.size.width / 2.0;
    }
    return _centerView;
}

- (UIBezierPath *)path
{
    if (!_path) {
        _path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(layerWidth / 2.0, layerWidth / 2.0) radius:layerWidth / 2.0 - 5.0 startAngle:-M_PI_2 endAngle:M_PI * 3.0 / 2.0 clockwise:YES];
    }
    return _path;
}

@end
