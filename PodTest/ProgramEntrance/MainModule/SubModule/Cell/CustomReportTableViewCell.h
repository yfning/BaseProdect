//
//  CustomReportTableViewCell.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/19.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomReportTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *clickButton;
@property (weak, nonatomic) IBOutlet UITextField *recordTextField;

@end
