//
//  RecordFirstInfoViewController.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "RecordFirstInfoViewController.h"
#import "RecordFirstNextViewController.h"

@interface RecordFirstInfoViewController ()
@property (weak, nonatomic) IBOutlet UIView *scrollBackView;
@property (nonatomic , strong) BaseScrollView * scrollView;
@property (nonatomic , strong) BaseView * baseView;
@end

@implementation RecordFirstInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"录入首访信息";
    [self addLeftBarButtonWithImageName:Default_back_ImageName Action:@selector(popBackView) isdefault:YES];
    [self createScrollView];
}

-(void)createScrollView{
    
    _scrollView = [[BaseScrollView alloc]initWithFrame:(CGRectMake(0, 0, MainScreenWidth - 20, _scrollBackView.frame.size.height))];
    [_scrollBackView addSubview:_scrollView];
    
    _baseView = [[BaseView alloc]initWithFrame:(CGRectMake(0, 0, _scrollView.frame.size.width, _scrollBackView.frame.size.height))];
    [_baseView createRecordFirstInfoView];
    [_scrollView addSubview:_baseView];
    
    
}
- (IBAction)pushNextAction:(id)sender {
    
    RecordFirstNextViewController * recordNext = [RecordFirstNextViewController new];
    [self.navigationController pushViewController:recordNext animated:YES];
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
