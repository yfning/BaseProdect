//
//  MainViewController.m
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#import "MainViewController.h"
#import "NextViewController.h"
#import "CustomerReceptionViewController.h"
#import "SpeechViewController.h"
#import "PlayRecordViewController.h"
#import "FollowRecordViewController.h"
#import "CustomReportViewController.h"




@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeRed:(id)sender {
    
    [self changeColorBackViewWithColor:[UIColor redColor]];
}
- (IBAction)changeBlue:(id)sender {
//    [self changeColorBackViewWithColor:[UIColor blueColor]];

    [self.navigationController pushViewController:[SpeechViewController new] animated:YES];
    
}
- (IBAction)changeGreen:(id)sender {
//    [self changeColorBackViewWithColor:[UIColor greenColor]];
    
    [self.navigationController pushViewController:[PlayRecordViewController new] animated:YES];

}
- (IBAction)nextViewAction:(id)sender {
    [self.navigationController pushViewController:[NextViewController new] animated:YES];
}

- (IBAction)pushbaobei:(id)sender {
    
    [self.navigationController pushViewController:[CustomReportViewController new] animated:YES];
    
}

- (IBAction)pushqiandao:(id)sender {
}
- (IBAction)pushjiefang:(id)sender {
    
    CustomerReceptionViewController * reception = [CustomerReceptionViewController new];
    [self.navigationController pushViewController:reception animated:YES];
}
- (IBAction)pushgenke:(id)sender {
    
    [self.navigationController pushViewController:[FollowRecordViewController new] animated:YES];
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];

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
