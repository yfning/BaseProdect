//
//  BaseManagerObject.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/19.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseManagerObject : NSObject

//+(void)alertWithShowMessage:(NSString *)showMessage showTitle:(NSString *)showTitle showButtonTitle:(NSString *)showButtonTitle;

+(void)logoutSystem;
+(void)changeRootViewController:(UIViewController *)rootController;
+(NSString *)timeFormatterFromTs:(NSString *)ts;
+(NSString *)time2FormatterFromTs:(NSString *)ts;


@end
