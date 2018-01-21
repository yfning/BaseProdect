//
//  NSString+Validation.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/16.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)
+(BOOL)IsPhoneNumber:(NSString *)number;
+(BOOL)IsEmailAdress:(NSString *)Email;
+(BOOL)IsIdentityCard:(NSString *)IDCardNumber;
+(BOOL)IsCheckIsIdentityCard:(NSString *)identityCard;
+(BOOL)IsBankCard:(NSString *)cardNumber;
@end
