//
//  BaseView.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/17.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)createRecordFirstInfoView{
    
    UILabel * baseInfoLabel = [[UILabel alloc]initWithFrame:(CGRectMake(FITWidth_320(50), 0, self.frame.size.width - FITWidth_320(50), FITWidth_320(35)))];
    [baseInfoLabel setText:@"基础信息"];
    [self addSubview:baseInfoLabel];
    
    UIView * lineView1 = [[UIView alloc]initWithFrame:(CGRectMake(0, baseInfoLabel.frame.origin.y + baseInfoLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView1 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView1];
    
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:(CGRectMake(baseInfoLabel.frame.origin.x, lineView1.frame.origin.y + lineView1.frame.size.height, FITWidth_320(120), baseInfoLabel.frame.size.height))];
    [nameLabel setText:@"姓名"];
    [self addSubview:nameLabel];
    
    UITextField * nameTextField = [[UITextField alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x + nameLabel.frame.size.width + 10, nameLabel.frame.origin.y, self.frame.size.width -(nameLabel.frame.origin.x + nameLabel.frame.size.width + 10) , nameLabel.frame.size.height))];
    [nameTextField setPlaceholder:@"请输入客户姓名"];
    [self addSubview:nameTextField];
    
    UIView * lineView2 = [[UIView alloc]initWithFrame:(CGRectMake(0, nameLabel.frame.origin.y + nameLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView2 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView2];
    
    UILabel * phoneLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView2.frame.origin.y + lineView2.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [phoneLabel setText:@"电话"];
    [self addSubview:phoneLabel];
    
    UITextField * phoneTextField = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, phoneLabel.frame.origin.y, nameTextField.frame.size.width , phoneLabel.frame.size.height))];
    [phoneTextField setPlaceholder:@"请输入客户手机"];
    [self addSubview:phoneTextField];
    
    UIView * lineView3 = [[UIView alloc]initWithFrame:(CGRectMake(0, phoneLabel.frame.origin.y + phoneLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView3 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView3];

    UILabel * sexLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView3.frame.origin.y + lineView3.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [sexLabel setText:@"性别"];
    [self addSubview:sexLabel];
    
    UITextField * sexValueLabel = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, sexLabel.frame.origin.y, nameTextField.frame.size.width, sexLabel.frame.size.height))];
    [sexValueLabel setPlaceholder:@"请选择性别"];
    [sexValueLabel setEnabled:NO];
    [self addSubview:sexValueLabel];
    
    UIButton * sexValueButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    sexValueButton.frame = sexValueLabel.frame;
    [self addSubview:sexValueButton];
    [sexValueButton addTarget:self action:@selector(sexValueButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIView * lineView4 = [[UIView alloc]initWithFrame:(CGRectMake(0, sexLabel.frame.origin.y + sexLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView4 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView4];
    UILabel * comeFromLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView4.frame.origin.y + lineView4.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [comeFromLabel setText:@"来源渠道"];
    [self addSubview:comeFromLabel];
    
    UITextField * comeFromValueLabel = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, comeFromLabel.frame.origin.y, nameTextField.frame.size.width, comeFromLabel.frame.size.height))];
    [comeFromValueLabel setPlaceholder:@"请选择来源渠道"];
    [comeFromValueLabel setEnabled:NO];
    [self addSubview:comeFromValueLabel];
    
    UIButton * comeFromValueButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    comeFromValueButton.frame = comeFromValueLabel.frame;
    [self addSubview:comeFromValueButton];
    [comeFromValueButton addTarget:self action:@selector(comeFromValueButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];

    
    UIView * lineView5 = [[UIView alloc]initWithFrame:(CGRectMake(0, comeFromLabel.frame.origin.y + comeFromLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView5 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView5];
    UILabel * cusLevelLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView5.frame.origin.y + lineView5.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [cusLevelLabel setText:@"客户等级"];
    [self addSubview:cusLevelLabel];
    
    UITextField * cusLevelTextField = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, cusLevelLabel.frame.origin.y, nameTextField.frame.size.width, cusLevelLabel.frame.size.height))];
    [cusLevelTextField setPlaceholder:@"请选择客户等级"];
    [cusLevelTextField setEnabled:NO];
    [self addSubview:cusLevelTextField];
    
    UIButton * cusLevelButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    cusLevelButton.frame = cusLevelTextField.frame;
    [self addSubview:cusLevelButton];
    [cusLevelButton addTarget:self action:@selector(cusLevelButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];

    
    UIView * lineView6 = [[UIView alloc]initWithFrame:(CGRectMake(0, cusLevelLabel.frame.origin.y + cusLevelLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView6 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView6];
    UILabel * associateLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView6.frame.origin.y + lineView6.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [associateLabel setText:@"关联人"];
    [self addSubview:associateLabel];
    
    UITextField * associateTextField = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, associateLabel.frame.origin.y, nameTextField.frame.size.width, associateLabel.frame.size.height))];
    [associateTextField setPlaceholder:@"请选择关联人"];
    [associateTextField setEnabled:NO];
    [self addSubview:associateTextField];
    
    UIButton * associateButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    associateButton.frame = associateTextField.frame;
    [self addSubview:associateButton];
    [associateButton addTarget:self action:@selector(associateButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];

    
    
    
}

-(void)createRecordNextFirstInfoView{
    
    UILabel * baseInfoLabel = [[UILabel alloc]initWithFrame:(CGRectMake(FITWidth_320(50), 0, self.frame.size.width - FITWidth_320(50), FITWidth_320(35)))];
    [baseInfoLabel setText:@"意向信息"];
    [self addSubview:baseInfoLabel];
    
    UIView * lineView1 = [[UIView alloc]initWithFrame:(CGRectMake(0, baseInfoLabel.frame.origin.y + baseInfoLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView1 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView1];

    UILabel * nameLabel = [[UILabel alloc]initWithFrame:(CGRectMake(baseInfoLabel.frame.origin.x, lineView1.frame.origin.y + lineView1.frame.size.height, FITWidth_320(120), baseInfoLabel.frame.size.height))];
    [nameLabel setText:@"意向项目"];
    [self addSubview:nameLabel];

    UITextField * nameTextField = [[UITextField alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x + nameLabel.frame.size.width + 10, nameLabel.frame.origin.y, self.frame.size.width -(nameLabel.frame.origin.x + nameLabel.frame.size.width + 10) , nameLabel.frame.size.height))];
//    [nameTextField setPlaceholder:@"请输入客户姓名"];
    [self addSubview:nameTextField];
//
//    UIView * lineView2 = [[UIView alloc]initWithFrame:(CGRectMake(0, nameLabel.frame.origin.y + nameLabel.frame.size.height + 1, self.frame.size.width, 1))];
//    [lineView2 setBackgroundColor:[UIColor grayColor]];
//    [self addSubview:lineView2];
//
//    UILabel * phoneLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView2.frame.origin.y + lineView2.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
//    [phoneLabel setText:@"意向产品"];
//    [self addSubview:phoneLabel];
//
//    UITextField * phoneTextField = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, phoneLabel.frame.origin.y, nameTextField.frame.size.width , phoneLabel.frame.size.height))];
//    [phoneTextField setPlaceholder:@"请输入客户手机"];
//    [self addSubview:phoneTextField];
    
    UIView * lineView3 = [[UIView alloc]initWithFrame:(CGRectMake(0, nameLabel.frame.origin.y + nameLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView3 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView3];
    
    UILabel * sexLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView3.frame.origin.y + lineView3.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [sexLabel setText:@"意向产品"];
    [self addSubview:sexLabel];
    
    UITextField * sexValueLabel = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, sexLabel.frame.origin.y, nameTextField.frame.size.width, sexLabel.frame.size.height))];
    [sexValueLabel setPlaceholder:@"请选择客户意向产品"];
    [sexValueLabel setEnabled:NO];
    [self addSubview:sexValueLabel];
    
    UIButton * sexValueButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    sexValueButton.frame = sexValueLabel.frame;
    [self addSubview:sexValueButton];
    [sexValueButton addTarget:self action:@selector(sexValueButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIView * lineView4 = [[UIView alloc]initWithFrame:(CGRectMake(0, sexLabel.frame.origin.y + sexLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView4 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView4];
    UILabel * comeFromLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView4.frame.origin.y + lineView4.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [comeFromLabel setText:@"意向户型"];
    [self addSubview:comeFromLabel];
    
    UITextField * comeFromValueLabel = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, comeFromLabel.frame.origin.y, nameTextField.frame.size.width, comeFromLabel.frame.size.height))];
    [comeFromValueLabel setPlaceholder:@"请选择客户意向户型"];
    [comeFromValueLabel setEnabled:NO];
    [self addSubview:comeFromValueLabel];
    
    UIButton * comeFromValueButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    comeFromValueButton.frame = comeFromValueLabel.frame;
    [self addSubview:comeFromValueButton];
    [comeFromValueButton addTarget:self action:@selector(comeFromValueButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIView * lineView5 = [[UIView alloc]initWithFrame:(CGRectMake(0, comeFromLabel.frame.origin.y + comeFromLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView5 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView5];
    UILabel * cusLevelLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView5.frame.origin.y + lineView5.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [cusLevelLabel setText:@"意向面积"];
    [self addSubview:cusLevelLabel];
    
    UITextField * cusLevelTextField = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, cusLevelLabel.frame.origin.y, nameTextField.frame.size.width, cusLevelLabel.frame.size.height))];
    [cusLevelTextField setPlaceholder:@"请选择客户意向面积"];
    [cusLevelTextField setEnabled:NO];
    [self addSubview:cusLevelTextField];
    
    UIButton * cusLevelButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    cusLevelButton.frame = cusLevelTextField.frame;
    [self addSubview:cusLevelButton];
    [cusLevelButton addTarget:self action:@selector(cusLevelButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIView * lineView6 = [[UIView alloc]initWithFrame:(CGRectMake(0, cusLevelLabel.frame.origin.y + cusLevelLabel.frame.size.height + 1, self.frame.size.width, 1))];
    [lineView6 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineView6];
    UILabel * associateLabel = [[UILabel alloc]initWithFrame:(CGRectMake(nameLabel.frame.origin.x, lineView6.frame.origin.y + lineView6.frame.size.height, FITWidth_320(120), nameLabel.frame.size.height))];
    [associateLabel setText:@"关注因素"];
    [self addSubview:associateLabel];
    
    UITextField * associateTextField = [[UITextField alloc]initWithFrame:(CGRectMake(nameTextField.frame.origin.x, associateLabel.frame.origin.y, nameTextField.frame.size.width, associateLabel.frame.size.height))];
    [associateTextField setPlaceholder:@"请选择客户关注因素"];
    [associateTextField setEnabled:NO];
    [self addSubview:associateTextField];
    
    UIButton * associateButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    associateButton.frame = associateTextField.frame;
    [self addSubview:associateButton];
    [associateButton addTarget:self action:@selector(associateButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    
}

-(void)sexValueButtonAction:(id)sender{
    
}

-(void)comeFromValueButtonAction:(id)sender{
    
}

-(void)cusLevelButtonAction:(id)sender{
    
}
-(void)associateButtonAction:(id)sender{
    
}

@end
