//
//  LOTAnimationView+touch.m
//  PlatformTop
//
//  Created by Jack on 22/11/2019.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "LOTAnimationView+touch.h"

#import <UIKit/UIKit.h>


@implementation LOTAnimationView (touch)

- (void)ndTouchCallBack:(void(^)(void))callBack {
    UIButton *btn;
    if (!btn) {
        btn = [UIButton new];
        [self addSubview:btn];
        btn.frame =self.bounds;
    }
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        callBack();
    }];
}


@end
