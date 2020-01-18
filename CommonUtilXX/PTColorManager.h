//
//  PTColorManager.h
//  PlatformTop
//
//  Created by Colin on 02/01/2020.
//  Copyright © 2020 liuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTColorManager : NSObject
+ (UIColor *)colorForConfig:(id)color;
+ (UIColor *)colorForConfig:(id)color index:(int)index;
@end

NS_ASSUME_NONNULL_END
