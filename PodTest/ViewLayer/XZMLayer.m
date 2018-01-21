//
//  XZMLayer.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/15.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "XZMLayer.h"


@implementation XZMLayer



//-(void)setDatas:(NSArray <NSNumber *>*)datas color:(NSArray <UIColor *>*)colors{
//
//    NSArray * newDatas = [self getPersentArraysWithDataArray:datas];
//    CGFloat start = 0.f;
//    CGFloat end = 0.f;
//    UIBezierPath *piePath = [UIBezierPath bezierPathWithArcCenter:_center radius:_radius + Hollow_Circle_Radius startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
//
//    for (int i = 0; i < newDatas.count; i ++) {
//        NSNumber *number = newDatas[i];
//        end =  start + number.floatValue;
//        CAShapeLayer *pieLayer = [CAShapeLayer layer];
//        pieLayer.strokeStart = start;
//        pieLayer.strokeEnd = end;
//        pieLayer.lineWidth = _radius*2 - Hollow_Circle_Radius;
//        pieLayer.strokeColor = [colors.count > i?colors[i]:kPieRandColor CGColor];
//        pieLayer.fillColor = [UIColor clearColor].CGColor;
//        pieLayer.path = piePath.CGPath;
//
//        [self.layer addSublayer:pieLayer];
//        start = end;
//    }
//}
//
//-(NSArray *)getPersentArraysWithDataArray:(NSArray *)datas{
//
//    NSArray * newDatas = [datas sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//
//        if ([obj1 floatValue] < [obj2 floatValue]) {
//            return  NSOrderedDescending;
//        }else if ([obj1 floatValue] < [obj2 floatValue]) {
//            return NSOrderedAscending;
//        }else{
//            return NSOrderedSame;
//        }
//
//    }];
//
//    NSMutableArray * persentArray = [[NSMutableArray alloc]init];
//    NSNumber *sum = [newDatas valueForKeyPath:@"@sum.floatValue"];
//    for (NSNumber *number in newDatas) {
//        [persentArray addObject:@(number.floatValue/sum.floatValue)];
//    }
//
//    return persentArray;
//
//}

@end
