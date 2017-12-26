//
//  MainViewController.m
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#import "MainViewController.h"
#import "NextViewController.h"

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
    [self changeColorBackViewWithColor:[UIColor blueColor]];

}
- (IBAction)changeGreen:(id)sender {
    [self changeColorBackViewWithColor:[UIColor greenColor]];

}
- (IBAction)nextViewAction:(id)sender {
    [self.navigationController pushViewController:[NextViewController new] animated:YES];
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
