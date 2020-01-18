//
//  ConfigInfo.m
//  PlatformTop
//
//  Created by Jack on 15/10/2019.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "ConfigInfo.h"
#import "NSData+PTDecode.h"

#define Config_FileName                     @"app.config.plist"
#define Config_AppDomain                    @"Config_AppDomain"
#define Config_AppDomainArr                   @"Config_AppDomainArr"
#define Config_appLocalVersion                   @"Config_appLocalVersion"
#define Config_appTemplateId                 @"Config_appTemplateId"
#define Config_appIsFirstLoad                @"Config_appIsFirstLoad"
#define Config_appWebsite                @"Config_appWebsite"
#define Config_QQAppKey                @"Config_QQAppKey"
#define Config_WXAppKey                @"Config_WXAppKey"
#define Config_QQSecert                @"Config_QQSecert"
#define Config_WXSecert                @"Config_WXSecert"
#define Config_isVisiterLogin                @"Config_isVisiterLogin"
#define Config_getStoreLoginStatus     @"Config_getStoreLoginStatus"
#define Config_password   @"eyJ0eXAiOiJKV1ee"

@implementation ConfigInfo

+ (void)initialize
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:Config_FileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        
        //设置应用信息
        [dictionary setObject:@""
                       forKey:Config_AppDomain];
        //设置客户端信息
        //        [dictionary setObject:[SecureUDID UDIDForDomain:Config_Domain usingKey:Config_DomainKey]
        //                       forKey:Config_ClientUDID];
        //写入配置文件
        [dictionary writeToFile:plistPath atomically:YES];
    }
    else {
        
    }
}


#pragma mark -- 加密方法
+ (NSString*)localInfoEncryptMethod:(NSString*)str {
    //加密方法
    NSData *dataEncrypt  =  [NSData CCCryptData:[str dataUsingEncoding:NSUTF8StringEncoding]   operation:kCCEncrypt key:Config_password];
    NSString*  hex = [self convertDataToHexStr:dataEncrypt];
    return hex;
}

#pragma mark -- 本地信息解密方法

+ (NSString*)localInfoDecryptMethod:(NSString*)str {
    NSData *dataDecrypt  =  [NSData CCCryptData:[self convertHexStrToData:str]   operation:kCCDecrypt key:Config_password];
    NSString *decrypt = [[NSString alloc] initWithData:dataDecrypt encoding:NSUTF8StringEncoding];
    return decrypt;
}







#pragma mark - 配置操作

/**
 *
 *
 *  @return 请求域名
 */
+ (NSString *)appDomain {
    NSString *value = [self getConfigValue:Config_AppDomain];
    if (value) {
        return value;
    }
    else {
        return @"";
    }
}

/**
 *
 *
 *  设置 请求域名
 */
+ (void)appDomain:(NSString *)appDomain {
    [self setConfigValue:appDomain key:Config_AppDomain];
    
}

/**
 *
 *
 *  @return 请求域名数组
 */
+ (NSArray *)appDomainArr {
    NSArray *value = [self getConfigValue:Config_AppDomainArr];
    if (value) {
        return value;
    }
    else {
        return [NSArray new];
    }
}

/**
 *
 *
 * 请求域名数组
 */
+ (void)appDomainArr:(NSArray *)appDomainArr {
    [self setConfigValue:appDomainArr key:Config_AppDomainArr];
}


/**
 *
 *
 *  本地和后台定义的版本号
 */
+ (NSString *)appLocalVersion {
    NSString *value = [self getConfigValue:Config_appLocalVersion];
    if (value) {
        return value;
    }
    else {
        return @"";
    }
}

/**
 *
 *
 *  本地和后台定义的版本号
 */
+ (void)appLocalVersion:(NSString *)appLocalVersion {
    [self setConfigValue:appLocalVersion key:Config_appLocalVersion];
}



/**
 *
 *
 *    后台资源版本id
 */
+ (NSString *)appTemplateId {
    NSString *value = [self getConfigValue:Config_appTemplateId];
    if (value) {
        return value;
    }
    else {
        return @"";
    }
}

/**
 *
 *
 *   后台资源版本id
 */
+ (void)appTemplateId:(NSString *)appTemplateId {
    [self setConfigValue:appTemplateId key:Config_appTemplateId];
}


/**
 *
 *
 *    app 是否是第一次启动
 */
+ (NSString *)appIsFirstLoad {
    NSString *value = [self getConfigValue:Config_appIsFirstLoad];
    if (value) {
        return value;
    }
    else {
        return @"";
    }
}

/**
 *
 *
 *   app 是否是第一次启动
 */
+ (void)appIsFirstLoad:(NSString *)appIsFirstLoad {
    [self setConfigValue:appIsFirstLoad key:Config_appIsFirstLoad];
}


/**
 *
 *
 *  首页显示的网址
 */
+ (NSString *)appWebsite
{
    return [self getConfigValue:Config_appWebsite];
}

/**
 *
 *
 *  首页显示的网址
 */
+ (void)appWebsite:(NSString *)appWebsite
{
    [self setConfigValue:appWebsite key:Config_appWebsite];
}

/**
 *
 *
 *  获取QQAppKey
 */
+ (NSString *)qqAppKey
{
    return [self getConfigValue:Config_QQAppKey];
}

/**
 *
 *
 *  获取QQAppKey
 */
+ (void)qqAppKey:(NSString *)qqAppKey
{
    [self setConfigValue:qqAppKey key:Config_QQAppKey];
}


/**
 *
 *
 *  获取WXAppKey
 */
+ (NSString *)wxAppKey
{
    return [self getConfigValue:Config_WXAppKey];
}


/**
 *
 *
 *  获取WXAppKey
 */
+ (void)wxAppKey:(NSString *)wxAppKey
{
    [self setConfigValue:wxAppKey key:Config_WXAppKey];
}

/**
 *
 *
 *  获取QQSecert
 */
+ (NSString *)qqSecert
{
    return [self getConfigValue:Config_QQSecert];
}

/**
 *
 *
 *  获取qqSecert
 */
+ (void)qqSecert:(NSString *)qqSecert
{
    [self setConfigValue:qqSecert key:Config_QQSecert];
}

/**
 *
 *
 *  获取wxSecert
 */
+ (NSString *)wxSecert
{
    return [self getConfigValue:Config_WXSecert];
}

/**
 *
 *
 *  获取是否登陆
 */
+ (BOOL)isLogin {
    if (kAppDelegate.userModel.token.length>0) {
        return YES;
    }
    return NO;
}

/**
 *
 *
 *  判断是否是游客登录
 */
+ (BOOL)isVisiterLogin {
    if ([kAppDelegate.userModel.userType intValue]==2) {
        return YES;
    }
    return NO;
}

/**
 *
 *
 *  存入状态
 */
+ (void)isVisiterLogin:(NSString*)visiterLog {
    [self setConfigValue:visiterLog key:Config_isVisiterLogin];
}



/**
 *
 *
 *  获取wxSecert
 */
+ (void)wxSecert:(NSString *)wxSecert
{
    [self setConfigValue:wxSecert key:Config_WXSecert];
}

//存入个人中心数据
+ (void)setpersonalUserinfo:(PTUserModel*)model {
    [NSKeyedArchiver archiveRootObject:model toFile:[UIUtils getDocumentFile:kUserInoFileName]];
}

//存入用户信息
+ (void)storeinfo:(id)info withKey:(NSString*)key {
    NSDictionary *sdic =[[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSMutableDictionary *totalInfodic =[NSMutableDictionary dictionary];
    if (sdic) {
        [totalInfodic addEntriesFromDictionary:sdic];
    }
    if (info) {
        [totalInfodic addEntriesFromDictionary:info];
    }
    [[NSUserDefaults standardUserDefaults] setObject:totalInfodic forKey:key];
}

+ (id)getStoreInfos:(NSString *)key {
    NSDictionary *sdic =[[NSUserDefaults standardUserDefaults] objectForKey:key];
    return sdic;
}

//取数据
+ (id)getStoreInfo:(NSString*)key {
    NSDictionary *sdic =[[NSUserDefaults standardUserDefaults] objectForKey:key];
    return [sdic allKeys];
}


//存储上次登录状态 1 游客 2 手机 3 微信 4 QQ
+ (void)storeLoginStatus:(NSString*)type{
    [self setConfigValue:type key:Config_getStoreLoginStatus];
}

//获取上次登录的类型
+ (NSString*)getStoreLoginStatus{
    NSString *value = [self getConfigValue:Config_getStoreLoginStatus];
    if (value) {
        return value;
    }
    else {
        return @"";
    }
    return value;
}


+ (NSString *)clientVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)clientAppName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

#pragma mark - 配置文件操作

+ (id)getConfigValue:(id)key
{
    id rtn = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:Config_FileName];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    rtn = [dictionary objectForKey:key];
    if ([rtn isKindOfClass:[NSString class]]) {
        rtn = [self localInfoDecryptMethod:rtn];
    } else if ([rtn isKindOfClass:[NSArray class]]) {
        NSMutableArray *arr =[NSMutableArray arrayWithArray:rtn];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj =[self localInfoDecryptMethod:obj];
        }];
        rtn = arr;
    }
    if ((rtn == nil) || [rtn isEqualToString:@""]) {
        return @"";
    }
    return rtn;
}

+ (BOOL)setConfigValue:(id)value key:(id)key
{
    BOOL rtn = NO;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:Config_FileName];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSMutableDictionary *dictionaryNew = [dictionary mutableCopy];
    if ([value isKindOfClass:[NSString class]]) {
        value =[self localInfoEncryptMethod:value];
    } else if ([value isKindOfClass:[NSArray class]]) {
        NSMutableArray *arr =[NSMutableArray arrayWithArray:value];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *msg =[self localInfoEncryptMethod:obj];
            [arr replaceObjectAtIndex:idx withObject:msg];
        }];
        value = arr;
    }
    [dictionaryNew setObject:value forKey:key];
    rtn = [dictionaryNew writeToFile:plistPath atomically:YES];
    return rtn;
}


//二进制流站string
+ (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
        
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff]; if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    return string;
}

//字符串转二进制流
+ (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
        
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
        
    } else {
        range = NSMakeRange(0, 1);
        
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

// 字典转json 字符串
+ (NSString *)convertToJsonData:(NSDictionary *)dict

{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}


@end
