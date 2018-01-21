//
//  XZMLayer.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/15.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface XZMLayer : CAShapeLayer

@property (nonatomic,assign)CGFloat startAngle; //开始角度
@property (nonatomic,assign)CGFloat endAngle;   //结束角度
@property (nonatomic,assign)BOOL    isSelected; //是否已经选中

@end
