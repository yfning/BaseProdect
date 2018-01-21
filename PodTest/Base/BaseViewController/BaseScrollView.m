//
//  BaseScrollView.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/16.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "BaseScrollView.h"

@implementation BaseScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBounces:NO];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.contentInset = UIEdgeInsetsMake(0, 0, 34, 0);
            self.scrollIndicatorInsets = self.contentInset;
        }
        
        
    }
    
    return self;
}
@end
