//
//  SuperViewController.m
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()<UIAlertViewDelegate>

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIEventSubtypeNone;
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
    
//    [[UITabBar appearance] setBarTintColor:[UIColor redColor]];
////
//    [UITabBar appearance].translucent = NO;
    
    [self.tabBarController.tabBar setTintColor:[UIColor redColor]];

    
    
}


/*
 //再plist文件中设置View controller-based status bar appearance 为 NO才能起效
 [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
 
 //导航条上标题的颜色
 NSDictionary *navbarTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
 [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
 
 //导航条上UIBarButtonItem颜色
 [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
 
 //TabBar选中图标的颜色,默认是蓝色
 [[UITabBar appearance] setTintColor:[UIColor colorWithHex:0x15A230]];
 //TabBarItem选中的颜色
 [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHex:0x15A230]} forState:UIControlStateSelected];
 
 //导航条的背景颜色
 [[UINavigationBar appearance] setBarTintColor:[UIColor navigationbarColor]];
 
 //TabBar的背景颜色
 [[UITabBar appearance] setBarTintColor:[UIColor titleBarColor]];
 
 [UISearchBar appearance].tintColor = [UIColor redColor];
 //当某个class被包含在另外一个class内时，才修改外观。
 [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setCornerRadius:14.0];
 [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setAlpha:0.6];
 
 
 UIPageControl *pageControl = [UIPageControl appearance];
 pageControl.pageIndicatorTintColor = [UIColor colorWithHex:0xDCDCDC];
 pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
 
 [[UITextField appearance] setTintColor:[UIColor nameColor]];
 [[UITextView appearance]  setTintColor:[UIColor nameColor]];
 
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


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


-(void)alertWithShowMessage:(NSString *)showMessage showTitle:(NSString *)showTitle showButtonTitle:(NSString *)showButtonTitle{
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:showTitle message:showMessage delegate:self cancelButtonTitle:showButtonTitle otherButtonTitles: nil];
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}



@end
