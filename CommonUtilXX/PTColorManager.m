//
//  PTColorManager.m
//  PlatformTop
//
//  Created by Colin on 02/01/2020.
//  Copyright © 2020 liuyun. All rights reserved.
//

#import "PTColorManager.h"
#import "PTTargetManager.h"
#import "PTColorConfigModel.h"

@implementation PTColorManager

+ (UIColor *)colorForConfig:(id)color {
    
    return [self colorForConfig:color index:-1];
}

+ (UIColor *)colorForConfig:(id)color index:(int)index {
    
    if (!color) {
//          if (DEBUG) {
//              return UIColor.purpleColor;
//          } else {
        return UIColor.whiteColor;
//          }
    }
    if ([color isKindOfClass:[NSString class]]) {
        return [UIColor colorWithHexString:color];
    }
    if ([color isKindOfClass:[ImageColor class]]) {
        
        ImageColor * col = (ImageColor *)color;
        switch ([PTTargetManager currentTarget]) {
            case Target_671:
                return [UIColor colorWithHexString:col.color];
                break;
            case Target_Panda:
                return [UIColor colorWithPatternImage:[UIImage imageNamed:col.image]];
                break;
            default:
                return [UIColor clearColor];
                break;
        }
    }
    if ([color isKindOfClass:[NSArray class]]) {
        if (index >= [(NSArray *)color count] || index < 0) {
            return UIColor.clearColor;
        }
        return [UIColor colorWithHexString:color[index]];
    }
    
//    if (DEBUG) {
//        return UIColor.purpleColor;
//    } else {
        return UIColor.whiteColor;
//    }
}


@end
