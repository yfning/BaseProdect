//
//  NSString+UrlEncoding.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/16.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UrlEncoding)
//-(NSString *)URLEncodedString;
//-(NSString *)URLDecodeString;
+(NSString *)urlEncodedString:(NSString *)input;
+(NSString *)urlDecodeString:(NSString *)input;
@end
