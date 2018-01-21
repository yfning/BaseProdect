//
//  FollowRecordViewController.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/18.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "FollowRecordViewController.h"
#import "FollowRecordTableViewCell.h"
#import "FollowRecordLevelTwoViewController.h"


@interface FollowRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic , strong) NSMutableArray * listArray;
@property (weak, nonatomic) IBOutlet BaseTableView *listTableView;

@end

@implementation FollowRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addLeftBarButtonWithImageName:Default_back_ImageName Action:@selector(popBackView) isdefault:YES];
    
    _listTableView.delegate = self;
    _listTableView.dataSource = self;    
    [self setOrigainStyleIsBounces:NO object:_listTableView];
}

-(void)viewDidLayoutSubviews{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return FITHeight_568(147);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 20;
    return _listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FollowRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FollowRecordTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FollowRecordTableViewCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell.nameLabel sizeToFit];
    cell.nameLabelConstrainWeight.constant = cell.nameLabel.frame.size.width;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[FollowRecordLevelTwoViewController new] animated:YES];
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
