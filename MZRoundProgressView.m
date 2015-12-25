//
//  MZRoundProgressView.m
//  MZRoundProgressView
//
//  Created by Михаил Заславский on 25.12.15.
//  Copyright © 2015 Mikezs. All rights reserved.
//

#import "MZRoundProgressView.h"

@implementation MZRoundProgressView
{
    CGFloat startAngle;
    CGFloat endAngle;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    startAngle = M_PI * 1.5;
    endAngle = startAngle + self.progress*2*M_PI;
    self.animationDuration = 1.5;
    self.lineColor = [UIColor bluecolor];
    self.thickness = 3.0f;
    self.progress = 0;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    endAngle = startAngle + progress*2*M_PI;
}

- (void)updateProgressViewAnimated
{
    CAShapeLayer *circle=[CAShapeLayer layer];
    
    int side = MIN(CGRectGetWidth(self.frame),CGRectGetHeight(self.frame));
    
    circle.path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(side/2, side/2) radius:side/2 startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
    circle.fillColor=[UIColor clearColor].CGColor;
    circle.strokeColor=self.lineColor.CGColor;
    circle.lineWidth=self.thickness;
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration=self.animationDuration;
    animation.removedOnCompletion=NO;
    animation.fromValue=@(0);
    animation.toValue=@(1);
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [circle addAnimation:animation forKey:@"drawCircleAnimation"];
    
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [self.layer addSublayer:circle];
}

- (void)drawRect:(CGRect)rect
{
    [self updateProgressViewAnimated];
}

@end
