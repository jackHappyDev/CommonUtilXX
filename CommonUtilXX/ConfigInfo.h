//
//  ConfigInfo.h
//  PlatformTop
//
//  Created by Jack on 15/10/2019.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigInfo : NSObject

/**
 *
 *
 *  @return 请求域名
 */
+ (NSString *)appDomain;

/**
 *
 *
 *  @param 请求域名
 */
+ (void)appDomain:(NSString *)appDomain;


/**
 *
 *
 *  @return 请求域名数组
 */
+ (NSArray *)appDomainArr;

/**
 *
 *
 *  @param 请求域名数组
 */
+ (void)appDomainArr:(NSArray *)appDomainArr;


/**
 *
 *
 *  @return 本地和后台定义的版本号
 */
+ (NSString *)appLocalVersion;

/**
 *
 *
 *  @return 本地和后台定义的版本号
 */
+ (void)appLocalVersion:(NSString *)appLocalVersion;


/**
 *
 *
 *    后台资源版本id
 */
+ (NSString *)appTemplateId;

/**
 *
 *
 *   后台资源版本id
 */
+ (void)appTemplateId:(NSString *)appTemplateId;


/**
 *
 *
 *    app 是否是第一次启动
 */
+ (NSString *)appIsFirstLoad;

/**
 *
 *
 *   app 是否是第一次启动
 */
+ (void)appIsFirstLoad:(NSString *)appIsFirstLoad;

/**
 *
 *
 *  首页显示的网址
 */
+ (NSString *)appWebsite;

/**
 *
 *
 *  首页显示的网址
 */
+ (void)appWebsite:(NSString *)appWebsite;


/**
*
*
*  获取QQAppKey
*/
+ (NSString *)qqAppKey;

/**
*
*
*  获取QQAppKey
*/
+ (void)qqAppKey:(NSString *)qqAppKey;
/**
*
*
*  获取WXAppKey
*/
+ (NSString *)wxAppKey;

/**
*
*
*  获取WXAppKey
*/
+ (void)wxAppKey:(NSString *)wxAppKey;


/**
*
*
*  获取QQSecert
*/
+ (NSString *)qqSecert;

/**
*
*
*  获取qqSecert
*/
+ (void)qqSecert:(NSString *)qqSecert;
/**
*
*
*  获取wxSecert
*/
+ (NSString *)wxSecert;

/**
*
*
*  获取wxSecert
*/
+ (void)wxSecert:(NSString *)wxSecert;

/**
*
*
*  获取是否登陆
*/
+ (BOOL)isLogin;


/**
*
*
*  判断是否是游客登录
*/
+ (BOOL)isVisiterLogin;

 /**
 *
 *
 *  存入状态
 */
 + (void)isVisiterLogin:(NSString*)visiterLog;


//存入个人中心数据
+ (void)setpersonalUserinfo:(PTUserModel*)model;

//存入用户信息
+ (void)storeinfo:(id)info withKey:(NSString*)key;

//取数据
+ (id)getStoreInfo:(NSString*)key;

+ (id)getStoreInfos:(NSString *)key;

//存储上次登录状态 1 游客 2 手机 3 微信 4 QQ
+ (void)storeLoginStatus:(NSString*)type;
//获取上次登录的类型 
+ (NSString*)getStoreLoginStatus;

@end
