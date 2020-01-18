//
//  PTTargetManager.h
//  熊猫棋牌
//
//  Created by Colin on 03/01/2020.
//  Copyright © 2020 liuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    Target_unknow = 0,
    Target_671 = 1,
    Target_Panda
   
}TargetVersion;
@interface PTTargetManager : NSObject

+ (TargetVersion)currentTarget;

@end

NS_ASSUME_NONNULL_END
