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
    MainViewController * mainView = [[MainViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:mainView];
    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.rootViewController = nav;
}
- (IBAction)registrationAction:(id)sender {
    
    [self.navigationController pushViewController:[RegistrationViewController new] animated:YES];
}
- (IBAction)forgetPasswordAction:(id)sender {
    [self.navigationController pushViewController:[ForgetPassWordViewController new] animated:YES];
}




@end
