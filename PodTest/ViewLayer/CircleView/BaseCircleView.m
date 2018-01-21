//
//  BaseCircleView.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/16.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "BaseCircleView.h"
#import "XZMLayer.h"

#define KOffsetRadius 10 //偏移距离

@interface BaseCircleView (){
    
//    CAShapeLayer *_maskLayer;
    CGFloat _radius;
    CGPoint _center;
    CAShapeLayer * _circleLayer;
    
}

@end

@implementation BaseCircleView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
        _radius = self.frame.size.width/2.0 - 10;
        
         _circleLayer = [CAShapeLayer layer];
        _circleLayer.frame = self.bounds;
        _circleLayer.fillColor = [[UIColor clearColor] CGColor];
        _circleLayer.lineWidth = 20;
        _circleLayer.strokeColor = [[UIColor grayColor] CGColor];
        UIBezierPath * circlePath = [UIBezierPath bezierPathWithArcCenter:_center radius:_radius startAngle:0 endAngle:2*M_PI clockwise:YES];
        _circleLayer.path = circlePath.CGPath;
        self.layer.mask = _circleLayer;
    }
    
    return self;
}

-(void)setCircleViewWithColorArray:(NSArray <UIColor *>* )colorArray dataArray:(NSArray *)dataArray{
    
    CGFloat startAngle =0;
    CGFloat endAngle = startAngle;
    
    if (dataArray.count == 0) {
        return;
    }
    
    while (dataArray.count > self.layer.sublayers.count) {
        
        XZMLayer * circleLayer = [XZMLayer layer];
        circleLayer.frame = self.bounds;
        circleLayer.fillColor = [[UIColor clearColor] CGColor];
        circleLayer.lineWidth = 20;
        [self.layer addSublayer:circleLayer];
    }
    
    for (int i = 0;i <dataArray.count ; i++) {

        XZMLayer * circleLayer = (XZMLayer *)self.layer.sublayers[i];
        UIColor * color = colorArray[i];
        circleLayer.strokeColor = [color CGColor];
        CGFloat bite = 1.0/dataArray.count;
        NSLog(@"bite===%f",bite);
        endAngle = startAngle + M_PI*2*(bite);
        UIBezierPath * circlePath = [UIBezierPath bezierPathWithArcCenter:_center radius:_radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        circleLayer.startAngle = startAngle;
        circleLayer.endAngle = endAngle;
        circleLayer.path = circlePath.CGPath;
        NSLog(@"startangle == %f",startAngle);
        startAngle = endAngle;

    }
    
}

- (void)stroke{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 1.f;
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat:1.f];
    //禁止还原
    animation.autoreverses = NO;
    //禁止完成即移除
    animation.removedOnCompletion = NO;
    //让动画保持在最后状态
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_circleLayer addAnimation:animation forKey:@"strokeEnd"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [touches.anyObject locationInView:self];
    
    [self upDateLayersWithPoint:point];
    
    NSLog(@"%@",NSStringFromCGPoint(point));
}

- (void)upDateLayersWithPoint:(CGPoint)point{
    
    //如需做点击效果，则应采用第二种方法较好
    for (XZMLayer *layer in self.layer.sublayers) {
        
        if (CGPathContainsPoint(layer.path, &CGAffineTransformIdentity, point, 0) && !layer.isSelected) {
            layer.isSelected = YES;
            
            //原始中心点为（0，0），扇形所在圆心、原始中心点、偏移点三者是在一条直线，通过三角函数即可得到偏移点的对应x，y。
//            CGPoint currPos = layer.position;
//            double middleAngle = (layer.startAngle + layer.endAngle)/2.0;
//            CGPoint newPos = CGPointMake(currPos.x + KOffsetRadius*cos(middleAngle), currPos.y + KOffsetRadius*sin(middleAngle));
//            layer.position = newPos;
            
            layer.strokeColor = [[UIColor greenColor] CGColor];
            
        }else{
            
//            layer.position = CGPointMake(0, 0);
            layer.isSelected = NO;
//            layer.strokeColor = [[UIColor blueColor] CGColor];

        }
    }
}


@end
