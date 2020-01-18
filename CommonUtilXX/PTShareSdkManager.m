//
//  PTShareSdkManager.m
//  PlatformTop
//
//  Created by Jack on 20/10/2019.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTShareSdkManager.h"
#import <ShareSDK/ShareSDK.h>
#import <WXApi.h>
#import <TencentOpenAPI/QQApiInterface.h>
@implementation PTShareMethodModel

@end

@implementation PTShareSdkManager


+ (id)sharedInstance
{
    static PTShareSdkManager * share;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[PTShareSdkManager alloc] init];
    });
    return share;
}

//登录授权
- (void)loginAuthMethod:(PTShareMethodModel*)model succ:(void(^)(NSDictionary* info))succCallback error:(void(^)(NSDictionary* info))errCallback {
    if (![self judgeLocalAppStatus:model.stype==SSDKPlatformTypeWechat?1:2]) {
        if (model.stype==SSDKPlatformTypeWechat) {
            [MBProgressHUD showError:@"您还未安装微信客户端" toView:nil];
            errCallback(nil);
        } else {
            [MBProgressHUD showError:@"您还未安装QQ客户端" toView:nil];
            errCallback(nil);
        }
        return ;
    }
    if (model.stype==SSDKPlatformTypeQQ) {
        [ShareSDK authorize:model.stype settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    NSLog(@"%@",[user.credential rawData]);
                    //获取open install返回的平台agentId
                    NSString *agentId = [[NSUserDefaults standardUserDefaults]objectForKey:kAgentId];
                    NSDictionary *dic =[user.credential rawData];
                    NSMutableDictionary *mdic =[NSMutableDictionary dictionaryWithDictionary:dic];
                    [mdic setValue:dic[@"openid"] forKey:@"code"];
                    [mdic setValue:model.stype==SSDKPlatformTypeQQ?@"1":@"2" forKey:@"type"];
                    [mdic setValue:user.nickname forKey:@"nickname"];
                    [mdic setValue:agentId forKey:@"agentUserId"];
                    [mdic setValue:@"OPEN" forKey:@"enumRegisterType"];
                    [mdic setValue:user.icon forKey:@"headPortrait"];
                    succCallback(mdic);
                }
                    break;
                case SSDKResponseStateFail:
                {
                    NSLog(@"--%@",error.description);
                    //失败
                    //                         errCallback(@{@"error":error.description});
                      errCallback(nil);
                    break;
                }
                case SSDKResponseStateCancel:
                    //用户取消授权
                    //                        errCallback(@{@"error":@"您已取消登录授权"});
                      errCallback(nil);
                    break;
                    
                default:
                    break;
            }
        }];
    } else {
        [ShareSDK getUserInfo:SSDKPlatformTypeWechat onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    NSLog(@"%@",[user.credential rawData]);
                    NSDictionary *dic =[user.credential rawData];
                    NSMutableDictionary *mdic =[NSMutableDictionary dictionaryWithDictionary:dic];
                    [mdic setValue:model.stype==SSDKPlatformTypeQQ?@"1":@"2" forKey:@"thirdType"];
                    [mdic setValue:user.nickname forKey:@"nickname"];
//                    [dic setValue:@"OPEN" forKey:@"enumRegisterType"];
                    [mdic setValue:user.icon forKey:@"headPortrait"];
                    succCallback(mdic);
                }
                    break;
                case SSDKResponseStateFail:
                {
                    NSLog(@"--%@",error.description);
                    //失败
                    //                                   if (![error.description isEqualToString:@"请求失败"]) {
                    //                                       errCallback(@{@"error":error.description});
                    //                                   }
                      errCallback(nil);
                    break;
                }
                case SSDKResponseStateCancel:
                    //用户取消授权
                                                      errCallback(nil);
                    break;
                    
                default:
                    break;
            }
        }];
    }
    
}

//1 微信 2QQ
- (BOOL)judgeLocalAppStatus:(NSInteger)idx {
    BOOL wechat;
    BOOL qq;
    if (idx==1) {
        // 是否安装微信
        wechat = [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]];
        return wechat;
    } else {
        // 是否安装QQ
        qq     = [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"mqqapi://"]];
        return qq;
    }
}


//分享
- (void)sharemethod:(PTShareMethodModel*)model succ:(void(^)(NSDictionary* info))succCallback error:(void(^)(NSDictionary* info))errCallback{
    //    [self shareAuthMethod:model];
    switch (model.stype) {
        case SSDKPlatformTypeWechat:
        {
            if (![self judgeLocalAppStatus:1]) {
                [MBProgressHUD showError:@"您还未安装微信客户端" toView:nil];
                errCallback(nil);
                return;
            }
        }
            break;
        case SSDKPlatformTypeQQ:
        {
            if (![self judgeLocalAppStatus:2]) {
                [MBProgressHUD showError:@"您还未安装QQ客户端" toView:nil];
                errCallback(nil);
                return;
            }
        }
            break;
        case SSDKPlatformSubTypeWechatTimeline:
        {
            if (![self judgeLocalAppStatus:1]) {
                [MBProgressHUD showError:@"您还未安装微信客户端" toView:nil];
                errCallback(nil);
                return;
            }
        }
            break;
            
        default:
            break;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params SSDKSetupShareParamsByText:model.contents
                                images:model.images
                                   url:[NSURL URLWithString:model.url]
                                 title:model.title
                                  type:SSDKContentTypeAuto];
    
    [ShareSDK share:model.stype
         parameters:params
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData,
                      SSDKContentEntity *contentEntity, NSError *error) {
        switch (state) {
            case SSDKResponseStateSuccess:
                NSLog(@"成功");//成功
                succCallback(nil);
                break;
            case SSDKResponseStateFail:
            {
                NSString *msg=@"暂未获取到分享信息";
                if ([error.userInfo[@"error_code"] integerValue]==200104) {
                    if (model.stype==SSDKPlatformTypeWechat||model.stype==SSDKPlatformSubTypeWechatTimeline) {
                        msg =@"微信未安装";
                    } else if(model.stype ==SSDKPlatformTypeQQ) {
                        msg =@"QQ未安装";
                    }
                    [MBProgressHUD showError:msg toView:nil];
                } else {
                    [MBProgressHUD showError:error.userInfo[@"description"] toView:nil];
                }
                break;
            }
            case SSDKResponseStateCancel:
                //取消
                break;
                
            default:
                break;
        }
    }];
}

@end
