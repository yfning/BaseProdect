//
//  CustomReportViewController.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/19.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "CustomReportViewController.h"
#import "CustomReportTableViewCell.h"


@interface CustomReportViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (nonatomic , strong) NSMutableArray * listArray;

@end

@implementation CustomReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addLeftBarButtonWithImageName:Default_back_ImageName Action:@selector(popBackView) isdefault:YES];
    self.title = Customer_Reported;
    _listArray = [[NSMutableArray alloc]init];
    [_listArray addObject:Intention_Project];
    [_listArray addObject:Name];
    [_listArray addObject:Phone_num];

    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    [self setOrigainStyleIsBounces:NO object:_listTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButtonAction:(id)sender {
    
    [self alertWithShowMessage:PreparedForSuccess showTitle:@"" showButtonTitle:Determine];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return FITHeight_568(45);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    return _listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomReportTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CustomReportTableViewCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell.nameLabel setText:_listArray[indexPath.section]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//    return 35;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//
//    return 1;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
