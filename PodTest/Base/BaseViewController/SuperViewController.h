//
//  SuperViewController.h
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperViewController : UIViewController

-(void)changeColorBackViewWithColor:(UIColor *)color;
-(void)setOrigainStyleIsBounces:(BOOL)isBounces object:(UITableView *)object;
-(void)alertWithShowMessage:(NSString *)showMessage showTitle:(NSString *)showTitle showButtonTitle:(NSString *)showButtonTitle;
@end
