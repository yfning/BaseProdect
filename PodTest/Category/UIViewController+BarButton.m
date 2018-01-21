//
//  UIViewController+BarButton.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "UIViewController+BarButton.h"

@implementation UIViewController (BarButton)

-(void)addLeftBarButtonWithImageName:(NSString *)imageName Action:(SEL)action isdefault:(BOOL)isDefault{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,80,44)];
    
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    firstButton.frame = CGRectMake(0, 0, 40, 44);
    
    [firstButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    if (isDefault) {
        
        [firstButton addTarget:self action:(@selector(popBackView)) forControlEvents:UIControlEventTouchUpInside];

    }else{
        
        [firstButton addTarget:self action:(action) forControlEvents:UIControlEventTouchUpInside];
    }
    [view addSubview:firstButton];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

-(void)addRightBarButtonWithImageName:(NSString *)imageName Action:(SEL)action isdefault:(BOOL)isDefault{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,80,44)];
    
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    firstButton.frame = CGRectMake(10, 0, 40, 44);
    
    [firstButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [firstButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:firstButton];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
}


-(void)addRightTwoBarButtonsWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction{
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,80,44)];
    
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    firstButton.frame = CGRectMake(40, 0, 40, 44);
    
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    
    [firstButton addTarget:self action:firstAction forControlEvents:UIControlEventTouchUpInside];
    
    //    firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
    
    //    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,5 *kScreenWidth/375.0)];
    
    [view addSubview:firstButton];
    
    
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    secondButton.frame = CGRectMake(0, 0, 40, 44);
    
    [secondButton setImage:secondImage forState:UIControlStateNormal];
    
    [secondButton addTarget:self action:secondAction forControlEvents:UIControlEventTouchUpInside];
    
    secondButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
    
    //    [secondButton setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,0 *kScreenWidth/375.0)];
    
    [view addSubview:secondButton];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

-(void)popBackView{
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
