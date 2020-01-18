//
//  PTShareSdkManager.h
//  PlatformTop
//
//  Created by Jack on 20/10/2019.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>®
NS_ASSUME_NONNULL_BEGIN
@interface PTShareMethodModel : NSObject
@property SSDKPlatformType stype;
@property (nonatomic,strong) NSString *contents;
@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) BOOL isWX;
@end

@interface PTShareSdkManager : NSObject
+ (id)sharedInstance;
- (void)sharemethod:(PTShareMethodModel*)model succ:(void(^)(NSDictionary* info))succCallback error:(void(^)(NSDictionary* info))errCallback;

- (void)loginAuthMethod:(PTShareMethodModel*)model succ:(void(^)(NSDictionary* info))succCallback error:(void(^)(NSDictionary* info))errCallback;
@end

NS_ASSUME_NONNULL_END
