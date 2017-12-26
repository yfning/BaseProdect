//
//  UIImage+Compression.h
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compression)

/**
 *  图片压缩
 *
 *  @param sourceImg   被压缩的图片
 *  @param defineWidth 被压缩的尺寸(宽)
 *
 *  @return 被压缩的图片
 */
+(UIImage *)imageCompressed:(UIImage *)sourceImage withdefineWidth:(CGFloat)defineWidth ;
@end
