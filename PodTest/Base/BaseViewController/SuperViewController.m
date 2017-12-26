//
//  SuperViewController.m
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIEventSubtypeNone;
//    self.navigationController.navigationBar.translucent = NO;
    UIView * barBackground = self.navigationController.navigationBar.subviews.firstObject;
    if (@available(iOS 11.0, *))
    {
        [barBackground.subviews setValue:@(1) forKeyPath:@"alpha"];
    } else {
        barBackground.alpha = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeColorBackViewWithColor:(UIColor *)color{
    
    UIView * barBackground = self.navigationController.navigationBar.subviews.firstObject;
    if (@available(iOS 11.0, *))
    {
        [barBackground.subviews setValue:@(0) forKeyPath:@"alpha"];
    } else {
        barBackground.alpha = 0;
    }

    [self.navigationController.navigationBar setBackgroundColor:color];
    [self.view setBackgroundColor:color];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
