//
//  BaseCircleView.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/16.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCircleView : UIView

@property (nonatomic , strong) NSArray * colorArray;
-(void)setCircleViewWithColorArray:(NSArray <UIColor *>* )colorArray dataArray:(NSArray *)dataArray;
//-(void)setCircleView2;
-(void)stroke;
@end
