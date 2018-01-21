//
//  UIViewController+BarButton.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BarButton)
-(void)addLeftBarButtonWithImageName:(NSString *)imageName Action:(SEL)action isdefault:(BOOL)isDefault;
-(void)addRightBarButtonWithImageName:(NSString *)imageName Action:(SEL)action isdefault:(BOOL)isDefault;
-(void)addRightTwoBarButtonsWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction;
-(void)popBackView;

@end
