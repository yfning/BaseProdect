//
//  UserInfoViewController.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoTableViewCell.h"
#import "LoginLogViewController.h"
#import "ChangePassWordViewController.h"
#import "DownloadAddViewController.h"
#import "VersonNumViewController.h"

@interface UserInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) BaseTableView * userTableView;
@property (nonatomic , strong) NSArray * userTableArray;
@property (nonatomic , strong) UIView * topBackView;
@property (nonatomic , strong) UIButton * exitButton;
@property (nonatomic , strong) UIImageView * headerImageView;
@property (nonatomic , strong) UILabel * nameLabel;
@property (nonatomic , strong) UILabel * phoneLabel;
@property (nonatomic , strong) UILabel * teamLabel;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self createVeiw];
    
}

-(void)createVeiw{
    
    _topBackView = [[UIView alloc]initWithFrame:(CGRectMake(0, 10, MainScreenWidth, FITHeight_568(100)))];
    [_topBackView.layer setBorderWidth:1.2];
    [self.view addSubview:_topBackView];
    
    _headerImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(FITWidth_320(20), FITWidth_320(20), FITWidth_320(60), FITWidth_320(60)))];
    [_headerImageView.layer setBorderWidth:1.2];
    [_topBackView addSubview:_headerImageView];
    
    _nameLabel = [[UILabel alloc]initWithFrame:(CGRectMake(_headerImageView.frame.origin.x + _headerImageView.frame.size.width + FITWidth_320(10), _headerImageView.frame.origin.y, FITWidth_320(100), FITWidth_320(30)))];
    [_nameLabel setText:Default_name];
    [_topBackView addSubview:_nameLabel];
    
    _phoneLabel = [[UILabel alloc]initWithFrame:(CGRectMake(_nameLabel.frame.origin.x + _nameLabel.frame.size.width + 10, _nameLabel.frame.origin.y, FITWidth_320(120), _nameLabel.frame.size.height))];
    [_phoneLabel setText:Default_phone];
    [_topBackView addSubview:_phoneLabel];
    
    _teamLabel = [[UILabel alloc]initWithFrame:(CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y + _nameLabel.frame.size.height, MainScreenWidth - _headerImageView.frame.origin.y - _headerImageView.frame.size.width - FITWidth_320(10)*2, _nameLabel.frame.size.height))];
    [_teamLabel setText:Default_teamname];
    [_topBackView addSubview:_teamLabel];
    
    
    _exitButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_exitButton setFrame:(CGRectMake(FITWidth_320(10), MainOrigain_Height - FITHeight_568(55), MainScreenWidth - FITWidth_320(20), FITHeight_568(45)))];
    [_exitButton setTitle:@"退出" forState:(UIControlStateNormal)];
    [_exitButton.layer setBorderWidth:1.2];
    [_exitButton setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:_exitButton];
    
    NSLog(@"%f,%f,%f",MainScreenHeight,k_TabbarHeight,FITHeight_568(55));
    
    _userTableArray = @[@{@"leftImage":@"",@"source":@"修改密码"},@{@"leftImage":@"",@"source":@"登录日志"},@{@"leftImage":@"",@"source":@"下载地址"},@{@"leftImage":@"",@"source":[NSString stringWithFormat:@"%@ %@",@"版本号",kAppVersion]}];
    
    _userTableView = [[BaseTableView alloc]initWithFrame:(CGRectMake(0, _topBackView.frame.origin.y+ _topBackView.frame.size.height+1, MainScreenWidth, MainOrigain_Height - _topBackView.frame.origin.y- _topBackView.frame.size.height - FITHeight_568(55) - 10)) style:(UITableViewStylePlain)];
    [_userTableView.layer setBorderWidth:1.2];
    [self.view addSubview:_userTableView];
    _userTableView.delegate = self;
    _userTableView.dataSource = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return FITHeight_568(45);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _userTableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoTableViewCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary * sourceDic = _userTableArray[indexPath.section];
    [cell.leftImageView setImage:[UIImage imageNamed:sourceDic[@"leftImage"]]];
    [cell.infoLabel setText:sourceDic[@"source"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self pushNextViewControllerWithNumber:indexPath.section];
}

-(void)pushNextViewControllerWithNumber:(NSInteger)number{
    
    if (number == 0) {
        [self pushChangePassWordViewController];
    }
    if (number == 1) {
        [self pushLoginLogViewController];
    }
    if (number == 2) {
        [self pushDownloadAddViewController];
    }
    if (number == 3) {
        [self pushVersionViewController];
    }


}

-(void)pushLoginLogViewController{
    LoginLogViewController * loginLog = [LoginLogViewController new];
    [self.navigationController pushViewController:loginLog animated:YES];
}
-(void)pushChangePassWordViewController{
    ChangePassWordViewController * change = [ChangePassWordViewController new];
    [self.navigationController pushViewController:change animated:YES];
}
-(void)pushDownloadAddViewController{
    DownloadAddViewController * download = [DownloadAddViewController new];
    [self.navigationController pushViewController:download animated:YES];
}
-(void)pushVersionViewController{
    VersonNumViewController * version = [VersonNumViewController new];
    [self.navigationController pushViewController:version animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
