//
//  MJVideoTime.m
//  HBuilder
//
//  Created by 李宏贵 on 2019/6/26.
//  Copyright © 2019 DCloud. All rights reserved.
//

#import "MJVideoTime.h"
#import <AVFoundation/AVFoundation.h>
@implementation MJVideoTime
+ (long)timeAudioAndVideoFilePath:(NSString *)filePath time:(MJVideoTimeSuccessBlock)callBackBlock;
{
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];

    AVURLAsset *asset = [AVURLAsset assetWithURL:fileUrl];

    NSString *duration = [NSString stringWithFormat:@"%0.0f", ceil(CMTimeGetSeconds(asset.duration))];
    callBackBlock((long)ABS(duration.integerValue -1));
    return (long)ABS(duration.integerValue -1);
}
+ (long)timeAudioAndVideoURLPath:(NSURL *)urlPath time:(MJVideoTimeSuccessBlock)callBackBlock
{
    AVURLAsset *asset = [AVURLAsset assetWithURL:urlPath];

    NSString *duration = [NSString stringWithFormat:@"%0.0f", ceil(CMTimeGetSeconds(asset.duration))];
    callBackBlock((long)ABS(duration.integerValue -1));
    return (long)ABS(duration.integerValue -1);
}

+(long)durationAudioAndVideoFilePath:(NSString *)filePath time:(MJVideoTimeSuccessBlock)callBackBlock
{
    static long durationTime  = 0;
    AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:filePath]] error:nil];
    durationTime = player.duration;
    callBackBlock(player.duration);
    AVAudioFormat* format = player.format;
    NSLog(@"音频时长:%lf",player.duration);
    NSLog(@"音频声道数:%u",format.channelCount);
    NSLog(@"采样频率==%lf",format.sampleRate);////默认为:25600,所以也是按照这个频率来计算的
    return durationTime;
}
+(long)durationAudioAndVideoURLPath:(NSURL *)urlPath
{
    static long durationTime  = 0;
//    AVAudioPlayer* player = [[AVAudioPlayer alloc]init];
    dispatch_semaphore_t signal = dispatch_semaphore_create(0);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfURL:urlPath] error:nil];
        durationTime = player.duration;
        AVAudioFormat* format = player.format;
        NSLog(@"音频时长:%lf---urlPath:%@",player.duration,urlPath);
        NSLog(@"音频声道数:%u",format.channelCount);

        NSLog(@"采样频率==%lf",format.sampleRate);////默认为:25600,所以也是按照这个频率来计算的
    dispatch_semaphore_signal(signal);
//        durationTime = durationTime*(44100/format.sampleRate);
        dispatch_async(dispatch_get_main_queue(), ^{

        });
    });
    dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    return durationTime;
}
+(CGFloat)sizeAudioAndVideoURLPath:(NSURL *)urlPath
{

    static long durationTime  = 0;
    AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfURL:urlPath] error:nil];
    durationTime = player.duration;
    AVAudioFormat* format = player.format;
    NSLog(@"音频时长:%lf",player.duration);
    NSLog(@"音频声道数:%u",format.channelCount);
    NSLog(@"采样频率==%lf",format.sampleRate);////默认为:25600,所以也是按照这个频率来计算的
    CGFloat size = 44100*16*player.duration/(8*1024*1024);
    return size;
}
@end
