//
//  FollowRecordLevelTwoViewController.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/18.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "FollowRecordLevelTwoViewController.h"
#import "FollowLevelTwoTableViewCell.h"

#define Bottom_BackView_Height 45

@interface FollowRecordLevelTwoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (nonatomic , strong) NSMutableArray * listArray;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *speakButton;
@property (weak, nonatomic) IBOutlet UIButton *keyBoardButton;
@property (weak, nonatomic) IBOutlet UIButton *enterSpeakButton;
@property (weak, nonatomic) IBOutlet UITextView *showInfoTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *showInfoText_contants_height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomView_contants_height;


@end

@implementation FollowRecordLevelTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addLeftBarButtonWithImageName:Default_back_ImageName Action:@selector(popBackView) isdefault:YES];
    
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    
    [_enterSpeakButton addTarget:self action:@selector(recordStart:) forControlEvents:(UIControlEventTouchDown)];
    [_enterSpeakButton addTarget:self action:@selector(recordEnd:) forControlEvents:(UIControlEventTouchUpInside)];
    [_enterSpeakButton addTarget:self action:@selector(recordCannal:) forControlEvents:(UIControlEventTouchDragExit)];

    [_bottomView setHidden:YES];
    [self setOrigainStyleIsBounces:NO object:_listTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return FITHeight_568(180);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 20;
    return _listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FollowLevelTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FollowLevelTwoTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FollowLevelTwoTableViewCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell.nameLabel sizeToFit];
    cell.nameLabel_contants_width.constant = cell.nameLabel.frame.size.width;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_bottomView setHidden:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
}

- (IBAction)speakButtonAction:(id)sender {
    [self showEnterSpeakButtonOrshowInfoTextView:YES];

}
- (IBAction)keyBoardButtonAction:(id)sender {
    [self showEnterSpeakButtonOrshowInfoTextView:NO];
    [[BaseCDPAudioRecordManager manager] play];

}

-(void)recordStart:(UIButton *)sender{
    
    [[BaseCDPAudioRecordManager manager] startRecord:sender];
}
-(void)recordEnd:(UIButton *)sender{
    
    [[BaseCDPAudioRecordManager manager] endRecord:sender];

}

-(void)recordCannal:(UIButton *)sender{
    [[BaseCDPAudioRecordManager manager] cancelRecord:sender];

}


-(void)showEnterSpeakButtonOrshowInfoTextView:(BOOL)isShowEnterSpeakButton{
    
    _bottomView_contants_height.constant = Bottom_BackView_Height;
    if (isShowEnterSpeakButton) {
        [_showInfoTextView resignFirstResponder];
        [_showInfoTextView setHidden:YES];
        [_enterSpeakButton setHidden:NO];
    }else{
        [_showInfoTextView setHidden:NO];
        [_enterSpeakButton setHidden:YES];
    }
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
