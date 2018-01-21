//
//  XZMPieView.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/15.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZMLayer.h"

@interface XZMPieView : UIView

- (void)setDatas:(NSArray <NSNumber *>*)datas
          colors:(NSArray <UIColor *>*)colors;
-(void)stroke;
@end
