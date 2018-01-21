//
//  FollowRecordTableViewCell.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/18.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *levelImageView;
@property (weak, nonatomic) IBOutlet UILabel *followTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstTime;
@property (weak, nonatomic) IBOutlet UILabel *comeLabel;
@property (weak, nonatomic) IBOutlet UILabel *distriLabel;
@property (weak, nonatomic) IBOutlet UILabel *distriTimeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabelConstrainWeight;

@end
