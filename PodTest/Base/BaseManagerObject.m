//
//  BaseManagerObject.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/19.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "BaseManagerObject.h"
#import "ViewController.h"
#import "MianTabBarViewController.h"
#import "AppDelegate.h"

@interface BaseManagerObject ()

@end


@implementation BaseManagerObject

//-(void)alertWithShowMessage:(NSString *)showMessage showTitle:(NSString *)showTitle showButtonTitle:(NSString *)showButtonTitle{
//    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:showTitle message:showMessage delegate:self cancelButtonTitle:showButtonTitle otherButtonTitles: nil];
//    [alertView show];
//}
//
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//
//}

+(UIWindow *)lastWindow
{
    
    if(@available(iOS 11.0, *)){
        
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        return window;
    }
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}

+(void)logoutSystem{
    
    [self changeRootViewController:[ViewController new]];
}

+(void)changeRootViewController:(UIViewController *)rootController{
    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.rootViewController = rootController;
}

#pragma mark - 时间戳 转 时间字符串
+(NSString *)timeFormatterFromTs:(NSString *)ts{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    //    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSInteger l = [ts integerValue];
    NSDate *nowTime = [NSDate dateWithTimeIntervalSince1970:l];
    NSString *timeStr = [formatter stringFromDate:nowTime];
    return timeStr;
}

//格式包含时分秒
+(NSString *)time2FormatterFromTs:(NSString *)ts{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSInteger l = [ts integerValue];
    //    NSLog(@"***%ld",(long)l);
    NSDate *nowTime = [NSDate dateWithTimeIntervalSince1970:l];
    NSString *timeStr = [formatter stringFromDate:nowTime];
    return timeStr;
}



@end
