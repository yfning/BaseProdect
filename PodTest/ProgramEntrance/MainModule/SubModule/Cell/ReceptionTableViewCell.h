//
//  ReceptionTableViewCell.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceptionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewBackView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIView *tempView;
@property (weak, nonatomic) IBOutlet UILabel *distributionpeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *distributiontimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *reportpeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *reporttimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *clickButton;

-(void)setValueToCell:(id)sender;
@end
