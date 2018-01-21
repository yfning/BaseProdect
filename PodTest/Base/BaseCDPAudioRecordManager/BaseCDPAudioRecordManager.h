//
//  BaseCDPAudioRecordManager.h
//  PodTest
//
//  Created by 宁云峰 on 2018/1/19.
//  Copyright © 2018年 RT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCDPAudioRecordManager : NSObject <CDPAudioRecorderDelegate>
//@property (nonatomic , strong) CDPAudioRecorder *recorder;
@property (nonatomic , strong) UIImageView * showImageView;
+(instancetype)manager;
-(void)startRecord:(UIButton *)recordBtn;
-(void)endRecord:(UIButton *)recordBtn;
-(void)cancelRecord:(UIButton *)recordBtn;
-(void)play;
@end
