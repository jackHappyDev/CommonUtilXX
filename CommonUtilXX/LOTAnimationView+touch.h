//
//  LOTAnimationView+touch.h
//  PlatformTop
//
//  Created by Jack on 22/11/2019.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "LOTAnimationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LOTAnimationView (touch)
- (void)ndTouchCallBack:(void(^)(void))callBack;
@end

NS_ASSUME_NONNULL_END
