//
//  RecordFirstNextViewController.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "RecordFirstNextViewController.h"


@interface RecordFirstNextViewController ()
@property (weak, nonatomic) IBOutlet UIView *backScrollView;
@property (nonatomic , strong) BaseScrollView * scrollView;
@property (nonatomic , strong) BaseView * baseView;
@end

@implementation RecordFirstNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"录入首访信息";
    [self addLeftBarButtonWithImageName:Default_back_ImageName Action:@selector(popBackView) isdefault:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self createScrollView];
    });
}

-(void)createScrollView{
    
    _scrollView = [[BaseScrollView alloc]initWithFrame:(CGRectMake(0, 0, _backScrollView.frame.size.width, _backScrollView.frame.size.height))];
    [_backScrollView addSubview:_scrollView];
    
    _baseView = [[BaseView alloc]initWithFrame:(CGRectMake(0, 0, _scrollView.frame.size.width, _backScrollView.frame.size.height))];
    [_baseView createRecordNextFirstInfoView];
    [_scrollView addSubview:_baseView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)commitAction:(id)sender {
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
