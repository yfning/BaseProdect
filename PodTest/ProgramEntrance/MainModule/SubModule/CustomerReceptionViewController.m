//
//  CustomerReceptionViewController.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "CustomerReceptionViewController.h"
#import "ReceptionTableViewCell.h"
#import "RecordFirstInfoViewController.h"

@interface CustomerReceptionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet BaseTableView *receptionTableView;
@property (nonatomic , strong) NSMutableArray * receptionArray;

@end

@implementation CustomerReceptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"客户接访";
    [self addLeftBarButtonWithImageName:Default_back_ImageName Action:@selector(popBackView) isdefault:YES];
    [self createView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createView{
    
    _receptionArray = [[NSMutableArray alloc]init];
    _receptionTableView.delegate = self;
    _receptionTableView.dataSource = self;
    
    _receptionTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(bbb)];
    _receptionTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(bbb)];
    [_receptionTableView.mj_header beginRefreshing];
    
}

-(void)bbb{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_receptionTableView.mj_header endRefreshing];
    });
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    return _receptionArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return FITHeight_568(200);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReceptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReceptionTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ReceptionTableViewCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setValueToCell:nil];
//    NSDictionary * sourceDic = _receptionArray[indexPath.section];
    
//    [cell.leftImageView setImage:[UIImage imageNamed:sourceDic[@"leftImage"]]];
//    [cell.infoLabel setText:sourceDic[@"source"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecordFirstInfoViewController * record = [[RecordFirstInfoViewController alloc]init];
    [self.navigationController pushViewController:record animated:YES];
    
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
