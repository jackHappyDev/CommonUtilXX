//
//  getUUID.m
//  getUUID
//
//  Created by ckl@pmm on 16/9/18.
//  Copyright © 2016年 CKLPronetway. All rights reserved.
//

#import "getUUID.h"
#import "KeyChainStore.h"
#define  KEY_USERNAME_PASSWORD @"com.company.app.usernamepassword"
#define  KEY_USERNAME @"com.company.app.username"
#define  KEY_PASSWORD @"com.company.app.password"

@implementation getUUID

+ (NSString *)getUUID
{
    NSString * strUUID = (NSString *)[KeyChainStore load:KEY_USERNAME_PASSWORD];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        NSString *udid = [self getLocalUDID];
        if (udid && udid.length > 0) {
            strUUID = udid;
        }else{
            CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
            strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        }
        
        //将该uuid保存到keychain
        [KeyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
    }
    return strUUID;
}

//获取签名打进去的UDID
+ (NSString *)getLocalUDID
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Extend/custom1" ofType:nil];
     // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSString *localUDID = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return localUDID;
}

@end
