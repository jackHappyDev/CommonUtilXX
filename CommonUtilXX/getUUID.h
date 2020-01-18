//
//  getUUID.h
//  getUUID
//
//  Created by ckl@pmm on 16/9/18.
//  Copyright © 2016年 CKLPronetway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface getUUID : NSObject
+(NSString *)getUUID;

//获取签名打进去的UDID
+ (NSString *)getLocalUDID;

@end
