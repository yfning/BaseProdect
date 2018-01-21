//
//  BaseCDPAudioRecordManager.m
//  PodTest
//
//  Created by 宁云峰 on 2018/1/19.
//  Copyright © 2018年 RT. All rights reserved.
//

#import "BaseCDPAudioRecordManager.h"

@implementation BaseCDPAudioRecordManager


#pragma mark - CDPAudioRecorderDelegate代理事件
//更新音量分贝数峰值(0~1)

static BaseCDPAudioRecordManager* _manager = nil;
static CDPAudioRecorder* _recorder = nil;

+(instancetype)manager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_manager == nil) {
            _manager = [[BaseCDPAudioRecordManager alloc]init];
            _recorder = [CDPAudioRecorder shareRecorder];
            _recorder.delegate = _manager;
        }
    });
    return _manager;
}

-(void)updateVolumeMeters:(CGFloat)value{
    NSInteger no=0;
    
    if (value>0&&value<=0.14) {
        no = 1;
    } else if (value<= 0.28) {
        no = 2;
    } else if (value<= 0.42) {
        no = 3;
    } else if (value<= 0.56) {
        no = 4;
    } else if (value<= 0.7) {
        no = 5;
    } else if (value<= 0.84) {
        no = 6;
    } else{
        no = 7;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"mic_%ld",(long)no];
    _showImageView.image = [UIImage imageNamed:imageName];
}
//录音结束(url为录音文件地址,isSuccess是否录音成功)
-(void)recordFinishWithUrl:(NSString *)url isSuccess:(BOOL)isSuccess{
    //url为得到的caf录音文件地址,可直接进行播放,也可进行转码为amr上传服务器
    NSLog(@"录音完成,文件地址:%@",url);
    
    return;
    
    //如果需要将得到的caf录音文件进行转码为amr格式,可按照以下步骤转码
    //生成amr文件将要保存的路径
    NSString *filePath = [ApplicationDocumentsDirectory stringByAppendingPathComponent:@"CDPAudioFiles/CDPAudioRecord.amr"];
    
    //caf转码为amr格式
    [CDPAudioRecorder convertCAFtoAMR:[NSURL URLWithString:url].path savePath:filePath];
    
    NSLog(@"转码amr格式成功----文件地址为:%@",filePath);
}
#pragma mark - 各录音点击事件
//按下开始录音
-(void)startRecord:(UIButton *)recordBtn{
    [_recorder startRecording];
}
//点击松开结束录音
-(void)endRecord:(UIButton *)recordBtn{
    double currentTime=_recorder.recorder.currentTime;
    NSLog(@"本次录音时长%lf",currentTime);
    if (currentTime<1) {
        //时间太短
        _showImageView.image = [UIImage imageNamed:@"mic_0"];
        [self alertWithMessage:@"说话时间太短"];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [_recorder stopRecording];
            [_recorder deleteAudioFile];
        });
    }
    else{
        //成功录音
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [_recorder stopRecording];
            dispatch_async(dispatch_get_main_queue(), ^{
                _showImageView.image=[UIImage imageNamed:@"mic_0"];
            });
        });
        NSLog(@"已成功录音");
    }
}
//手指从按钮上移除,取消录音
-(void)cancelRecord:(UIButton *)recordBtn{
    _showImageView.image = [UIImage imageNamed:@"mic_0"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [_recorder stopRecording];
        [_recorder deleteAudioFile];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self alertWithMessage:@"已取消录音"];
        });
    });
    
}
#pragma mark - 播放点击事件
//播放录音
-(void)play{
    //播放内部默认地址刚才生成的本地录音文件,不需要转码
    [_recorder playAudioFile];
    
    return;
    
    //如果需要播放amr文件,按照以下步骤转码保存播放
    //获取转换后的amr文件路径
    NSString *filePath = [ApplicationDocumentsDirectory stringByAppendingPathComponent:@"CDPAudioFiles/CDPAudioRecord.amr"];
    //amr转码为caf可播放格式
    NSString *savefilePath = [ApplicationDocumentsDirectory stringByAppendingPathComponent:@"CDPAudioFiles/CDPAudioRecord222.caf"];
    
    //转换格式
    [CDPAudioRecorder convertAMRtoWAV:filePath savePath:savefilePath];
    
    //播放
    [[CDPAudioRecorder shareRecorder] playAudioWithUrl:[NSURL fileURLWithPath:savefilePath].absoluteString];
}

-(void)alertWithMessage:(NSString *)message{
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];
}


@end
