//
//  PTNeedSpeed.h
//  PlatformTop
//
//  Created by Jack on 15/10/2019.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//typedef void(^speedCallBack)(NSString*speed);
@interface PTNeedSpeed : NSObject

+ (id)sharedInstance;

- (void)startNeetSpeed:(void(^)(NSString*speed,NSInteger ispeed))speedBack;

- (void)stop;
@end

NS_ASSUME_NONNULL_END
