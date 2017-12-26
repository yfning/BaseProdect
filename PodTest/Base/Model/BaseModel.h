//
//  BaseModel.h
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
-(NSString *)IsNull:(id)tempValue;

@end
