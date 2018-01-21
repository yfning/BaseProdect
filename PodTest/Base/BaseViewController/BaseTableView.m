//
//  BaseTableView.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        [self setOrigainStyleIsBounces:YES object:self];

    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self setOrigainStyleIsBounces:YES object:self];
    }
    
    return self;

}

-(void)setOrigainStyleIsBounces:(BOOL)isBounces object:(UITableView *)object{
    
    [object setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [object setShowsHorizontalScrollIndicator:NO];
    [object setShowsVerticalScrollIndicator:NO];
    [object setBounces:isBounces];
    
    if (@available(iOS 11.0, *)) {
        object.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        object.contentInset = UIEdgeInsetsMake(0, 0, 34, 0);
        object.scrollIndicatorInsets = object.contentInset;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
