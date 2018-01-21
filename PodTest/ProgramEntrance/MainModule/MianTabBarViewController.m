//
//  MianTabBarViewController.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "MianTabBarViewController.h"
#import "UserInfoViewController.h"
#import "MainViewController.h"
#import "NextViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"


@interface MianTabBarViewController ()

{
    SuperViewController * _mainView;
}

@end

@implementation MianTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.tabBar.hidden = YES;
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self createCustomTabBar];
    [self createMainController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createCustomTabBar {
    //创建一个UIImageView，作为底图
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,MainScreenHeight - k_TabbarHeight, MainScreenWidth ,k_TabbarHeight)];
//    [bgView setBackgroundColor:[UIColor redColor]];
    //    NSLog(@"%.f",MainScreenWidth);
    bgView.backgroundColor = [UIColor whiteColor];
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 0.5)];
    [bgView addSubview:lineImage];
    bgView.tag = 999;
    //开启imageview的交互属性
    bgView.userInteractionEnabled = YES;
    [self.view addSubview:bgView];
    
    //创建button实例  模拟tabBarItem
    //每个button的间隔
    NSArray *nameArray = @[@"首页",@"统计",@"个人"];
    
    for (int i = 0; i<3; i++) {
        NSString *imageName = [NSString stringWithFormat:@"icon_%d.png",i];
        NSString *selectedImage = [NSString stringWithFormat:@"icon_%d_sel.png",i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置button处于常规状态下的背景图片
        [btn.layer setBorderWidth:1.2];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        //设置button处于选中状态下得背景图片
        [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        
        [btn setFrame:CGRectMake(bgView.frame.size.width / nameArray.count * i, 5, bgView.frame.size.width / nameArray.count - 1, 40)];
        [bgView addSubview:btn];
        
        if (i==0) {
            btn.selected = YES;
        }
    }
}

-(void)createMainController{
    
    MainViewController * mainView = [[MainViewController alloc]init];
    BaseNavViewController *navMain = [[BaseNavViewController alloc] initWithRootViewController:mainView];
    mainView.tabBarItem.title=@"首页";
    mainView.tabBarItem.image=[UIImage imageNamed:@"icon_home"];
//    mainView.tabBarItem.badgeValue=@"";
    
    NextViewController * next = [[NextViewController alloc]init];
    BaseNavViewController *navNext = [[BaseNavViewController alloc] initWithRootViewController:next];
    next.tabBarItem.title=@"统计";
    next.tabBarItem.image=[UIImage imageNamed:@"icon_home"];
//    next.tabBarItem.badgeValue=@"";

    
    UserInfoViewController * user = [[UserInfoViewController alloc]init];
    BaseNavViewController *navUser = [[BaseNavViewController alloc] initWithRootViewController:user];
    user.tabBarItem.title=@"个人";
    user.tabBarItem.image=[UIImage imageNamed:@"icon_home"];
//    user.tabBarItem.badgeValue=@"";
        
    [self addChildViewController:navMain];
    [self addChildViewController:navNext];
    [self addChildViewController:navUser];

}

-(void)btnClicked:(UIButton *)sender{
    
//    self.selectedIndex = button.tag;
    //切换不同btn的显示状态
    UIImageView *bgView = (UIImageView *)[self.view viewWithTag:999];
    for (UIView *subView in bgView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *btn1 = (UIButton *)subView;
            if (btn1.tag == sender.tag) {
                btn1.selected = YES;
            }else{
                btn1.selected = NO;
            }
        }else if ([subView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)subView;
            if (label.tag == sender.tag + 10) {
                label.textColor = [UIColor blueColor];
            }else {
                label.textColor = [UIColor grayColor];
            }
        }
    }
    self.tabBar.hidden = YES;
    //  点击每个tabbar返回每个tabbar首页 add by momo
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MianTabBarViewController *tabController  = (MianTabBarViewController *)app.window.rootViewController;
    if (![tabController isKindOfClass:[ViewController class]]) {
        UINavigationController *navController = (UINavigationController *)tabController.selectedViewController;
        [navController popToRootViewControllerAnimated:YES];
    }

    
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
