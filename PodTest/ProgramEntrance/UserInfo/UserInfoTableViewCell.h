//
//  UserInfoTableViewCell.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end
