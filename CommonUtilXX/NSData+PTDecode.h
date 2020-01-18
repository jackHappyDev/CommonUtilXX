//
//  NSData+PTDecode.h
//  PlatformTop
//
//  Created by Jack on 11/25/19.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (PTDecode)
+ (NSData *)CCCryptData:(NSData *)data
operation:(CCOperation)operation
                    key:(NSString *)key;

+ (NSData *)convertHexStrToData:(NSString *)str;

+ (NSString *)convertDataToHexStr:(NSData *)data;
@end

NS_ASSUME_NONNULL_END
