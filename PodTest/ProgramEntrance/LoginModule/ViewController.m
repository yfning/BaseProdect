//
//  ViewController.m
//  PodTest
//
//  Created by nyf on 2017/12/23.
//  Copyright © 2017年 RT. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"
#import "RegistrationViewController.h"
#import "ForgetPassWordViewController.h"
#import "MianTabBarViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%d,%d",Gray_Line_Color,Frame_Line_Color);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginAction:(id)sender {
//    MainViewController * mainView = [[MainViewController alloc]init];
    MianTabBarViewController * maintabBar = [[MianTabBarViewController alloc]init];
    
    [BaseManagerObject changeRootViewController:maintabBar];
}
- (IBAction)registrationAction:(id)sender {
    
//    CATransition *transition = [CATransition animation];
//    transition.duration = 4;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromRight;
    RegistrationViewController * regist =[RegistrationViewController new];
//    [regist.view.layer addAnimation:transition forKey:nil];
    [self presentViewController:regist animated:NO completion:nil];
    
//    [self.navigationController pushViewController:[RegistrationViewController new] animated:YES];
}
- (IBAction)forgetPasswordAction:(id)sender {
    
   ForgetPassWordViewController * forget = [ForgetPassWordViewController new];
    [self presentViewController:forget animated:NO completion:nil];

}




@end
