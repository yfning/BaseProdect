//
//  NextViewController.m
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#import "NextViewController.h"
#import "XZMPieView.h"
#import "ThePieChartView.h"
#import "BaseCircleView.h"
#import "ChartLineView.h"
@interface NextViewController ()
{
    XZMPieView * pieView;
    
    BaseCircleView * _circleView;
    
    ChartLineView * _chartLineView;
}
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _chartLineView = [[ChartLineView alloc]initWithFrame:(CGRectMake(FITWidth_320(10), FITHeight_568(100), MainScreenWidth - FITWidth_320(20), MainScreenWidth - FITHeight_568(40)))];
    [_chartLineView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_chartLineView];
    
//    [self getCircleView];
//    [self getpieView];



}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

}

-(void)getpieView{
    pieView = [[XZMPieView alloc]initWithFrame:CGRectMake(80, 350, 200, 200)];
    [self.view addSubview:pieView];
    [self setpieView];
}

-(void)setpieView{
    [pieView setDatas:[self getDatas] colors:@[[UIColor redColor],[UIColor purpleColor]]];
    [pieView stroke];
}

-(void)getCircleView{
    _circleView = [[BaseCircleView alloc]initWithFrame:(CGRectMake(80, 100, 200, 200))];
    [_circleView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_circleView];
    [self setCircleView];
}

-(void)setCircleView{
    [_circleView setCircleViewWithColorArray:[self getColors] dataArray:[self getDatas]];
}

- (NSArray *)getDatas{

    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 5 ; i++) {
        [arr addObject:@(arc4random()%100)];
    }
    
    return arr;
}

-(NSArray *)getColors{
    
    NSMutableArray *colorArray = [NSMutableArray array];
    
    [colorArray addObject:[UIColor redColor]];
    [colorArray addObject:[UIColor yellowColor]];
    [colorArray addObject:[UIColor blueColor]];
    [colorArray addObject:[UIColor greenColor]];
    [colorArray addObject:[UIColor purpleColor]];

    return colorArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
