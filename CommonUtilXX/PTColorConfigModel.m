//
//  PTConfigModel.m
//  PlatformTop
//
//  Created by Colin on 03/01/2020.
//  Copyright © 2020 liuyun. All rights reserved.
//

#import "PTColorConfigModel.h"
@implementation ImageColor

@end
@implementation ColorCommonModel

@end

@implementation ColorHomeModel

@end

@implementation ColorUserModel

@end

@implementation ColorRegisterModel

@end

@implementation ColorVIPInfoModel

@end

@implementation ColorActivityModel

@end

@implementation ColorSafeModel
@end

@implementation ColorAgentModel

@end

@implementation ColorSettingModel

@end

@implementation ColorMessageModel
@end

@implementation ColorPayModel
@end

@implementation ColorWashCodeModel

@end

@implementation ColorServiceModel
@end

@implementation ColorWithdrawModel
@end

@implementation ColorAlertViewModel
@end

@implementation ColorLeftViewModel
@end

@implementation PTColorConfigModel
static PTColorConfigModel* configModel = nil;

+(instancetype)shareConfigModel {
    
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        NSString * path = [[NSBundle mainBundle] pathForResource:@"ColorConfig" ofType:@"plist"];
        NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:path];
        configModel = [PTColorConfigModel mj_objectWithKeyValues:dic];
    }) ;
     
    return configModel ;
}

@end

