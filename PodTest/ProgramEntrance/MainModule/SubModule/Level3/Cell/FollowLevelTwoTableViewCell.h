//
//  FollowLevelTwoTableViewCell.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/18.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowLevelTwoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabel_contants_width;
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;
@property (weak, nonatomic) IBOutlet UILabel *followTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *chartBackView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *chartBackView_contant_height;
@property (weak, nonatomic) IBOutlet UILabel *thinkLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;


@end
