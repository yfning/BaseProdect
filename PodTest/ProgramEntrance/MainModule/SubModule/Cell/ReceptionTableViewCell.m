//
//  ReceptionTableViewCell.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "ReceptionTableViewCell.h"

@implementation ReceptionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setValueToCell:(id)sender{
    
    [self.headerImageView setImage:[UIImage imageNamed:@""]];
    [self.nameLabel setText:Default_name];
    [self.phoneLabel setText:Default_phone];
    [self.distributionpeopleLabel setText:[NSString stringWithFormat:@"%@：%@",@"分配人",Default_name]];
    [self.distributiontimeLabel setText:[NSString stringWithFormat:@"%@：%@",@"分配时间",Default_time]];
    [self.reportpeopleLabel setText:[NSString stringWithFormat:@"%@：%@",@"报备人",Default_name]];
    [self.reporttimeLabel setText:[NSString stringWithFormat:@"%@：%@",@"报备时间",Default_name]];

}

@end
