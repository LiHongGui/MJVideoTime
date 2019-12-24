//
//  MJVideoTime.h
//  HBuilder
//
//  Created by 李宏贵 on 2019/6/26.
//  Copyright © 2019 MichaelLi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MJVideoTimeSuccessBlock)(float time);
@interface MJVideoTime : NSObject
+ (long)timeAudioAndVideoFilePath:(NSString *)filePath time:(MJVideoTimeSuccessBlock)callBackBlock;
+ (long)timeAudioAndVideoURLPath:(NSURL *)urlPath time:(MJVideoTimeSuccessBlock)callBackBlock;
+(long)durationAudioAndVideoFilePath:(NSString *)filePath time:(MJVideoTimeSuccessBlock)callBackBlock;
+(long)durationAudioAndVideoURLPath:(NSURL *)urlPath;
+(CGFloat)sizeAudioAndVideoURLPath:(NSURL *)urlPath;
@property (nonatomic,copy)MJVideoTimeSuccessBlock callBackBlock;
@end

NS_ASSUME_NONNULL_END
