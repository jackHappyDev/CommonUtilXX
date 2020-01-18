//
//  PTUtilTools.m
//  PlatformTop
//
//  Created by Jack on 12/6/19.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTUtilTools.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@implementation PTUtilTools

+ (NSMutableAttributedString*)rangeStrBackTotalStr:(NSString*)tStr rgStr:(NSString*)rStr  color:(UIColor*)clo{
    if ([rStr containsString:@"#"]) {
        NSArray *arr =[rStr componentsSeparatedByString:@"#"];
        NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:tStr];
        NSDictionary * firstAttributes = @{NSForegroundColorAttributeName:clo,};
        for (NSString *s in arr) {
            NSRange range = [tStr rangeOfString:s];
            [firstPart setAttributes:firstAttributes range:range];
        }
        return firstPart;
    } else {
        NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:tStr];
        NSDictionary * firstAttributes = @{NSForegroundColorAttributeName:clo,};
        NSRange range = [tStr rangeOfString:rStr];
        [firstPart setAttributes:firstAttributes range:range];
        return firstPart;
    }
}

//将文字range色值
+ (NSMutableAttributedString*)rangeStrFontBackTotalStr:(NSString*)tStr rgStr:(NSString*)rStr   color:(UIColor*)clo font:(UIFont*)font{
    if ([rStr containsString:@"#"]) {
        NSArray *arr =[rStr componentsSeparatedByString:@"#"];
        NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:tStr];
        NSDictionary * firstAttributes = @{NSForegroundColorAttributeName:clo,};
        for (NSString *s in arr) {
            NSRange range = [tStr rangeOfString:s];
            [firstPart setAttributes:firstAttributes range:range];
        }
        return firstPart;
    } else {
        NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:tStr];
        NSDictionary * firstAttributes = @{NSForegroundColorAttributeName:clo,};
        NSDictionary * secAttributes = @{NSFontAttributeName:font,};
        NSRange range = [tStr rangeOfString:rStr];
        [firstPart setAttributes:firstAttributes range:range];
        [firstPart setAttributes:secAttributes range:range];
        return firstPart;
    }
}


//将文字range色值
+ (NSMutableAttributedString*)rangeStrBackTotalStr:(NSString*)tStr rang:(NSRange)range  color:(UIColor*)clo {
    NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:tStr];
    NSDictionary * firstAttributes = @{NSForegroundColorAttributeName:clo,};
    [firstPart setAttributes:firstAttributes range:range];
    return firstPart;
}

 

+ (CGFloat)calculateRowWidth:(NSString *)string {
    
    NSDictionary *dic = @{NSFontAttributeName:kFontWithBold(12)};
    
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0,30)/*计算宽度时要确定高度*/options:NSStringDrawingUsesLineFragmentOrigin |
                   
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    
    return rect.size.width;
    
}

+ (void)jianbianAction:(UIView*)V leftOrUp:(BOOL)direction startColor:(UIColor*)startcol stopColor:(UIColor*)stopCol{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startcol.CGColor, (__bridge id)stopCol.CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = direction==YES?CGPointMake(1.0, 0.0):CGPointMake(0.0, 1.0);
    gradientLayer.frame = CGRectMake(0, 0, V.width, V.height);
    [V.layer addSublayer:gradientLayer];
}

//将文字添加下划线
+ (NSMutableAttributedString*)rangeStrSubLineBackTotalStr:(NSString*)tStr rgStr:(NSString*)rStr  color:(UIColor*)clo {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:
                                      tStr];
    NSRange range =[tStr rangeOfString:rStr];
    [str addAttribute:NSForegroundColorAttributeName value:
     clo range:range];
    [str addAttribute:NSForegroundColorAttributeName value:
     clo range:range];
    [str addAttribute:NSUnderlineStyleAttributeName value:
     [NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range]; // 下划线类型
    [str addAttribute:NSUnderlineColorAttributeName value:
     clo range:range]; // 下划线颜色
    return str;
}


//textfield添加placeholder
+ (NSMutableAttributedString*)tefChangePlaceHolder:(NSString*)tStr  color:(UIColor*)clo {
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:tStr];
    [placeholder addAttribute:NSForegroundColorAttributeName value:clo range:NSMakeRange(0, tStr.length)];
    [placeholder addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:13] range:NSMakeRange(0, tStr.length)];
    return placeholder;
}

+ (void)viewChoiceWitchCorner:(UIView*)v coner:(UIRectCorner)coner sz:(float)sz{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:v.bounds byRoundingCorners:coner cornerRadii:CGSizeMake(sz, sz)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = v.bounds;
    maskLayer.path = maskPath.CGPath;
    v.layer.mask = maskLayer;
}

+ (void)tefLeftSpace:(UITextField*)tef foffset:(float)x  img:(NSString*)imgStr{
    
    UIView *lfview =[UIView new];
    lfview.frame =CGRectMake(0, 0, x, tef.height);
    tef.leftView =lfview;
    tef.leftViewMode=UITextFieldViewModeAlways; //此处用来设置leftview现实时机
    if (imgStr.length>0) {
        UIImageView *imageViewPwd=[[UIImageView alloc] initWithFrame:lfview.bounds];
        imageViewPwd.image=[UIImage imageNamed:imgStr];
        tef.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [lfview addSubview:imageViewPwd];
    }
    
}


//唤起云闪付 支付宝 微信的判断
+ (BOOL)thirdPayMethodLanuch:(PTThirdPayMethod)mtd {
    switch (mtd) {
        case PTThirdPayMethodWX:
        {
            BOOL  wechat = [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]];
            return wechat;
        }
            break;
            
        case PTThirdPayMethodALIPAY:
        {
            NSArray *arr =@[@"alipays",@"alipay"];
            __block BOOL zfb;
            [arr enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                BOOL ZFB = NO;
                NSURL *url =[NSURL URLWithString:[NSString stringWithFormat:@"%@://",obj]];
                ZFB = [[UIApplication sharedApplication]canOpenURL:url];
                zfb = ZFB;
                if (ZFB) {
                    zfb =ZFB;
                    *stop = YES;
                }
            }];
            return zfb;
            
        }
            break;
            
        case PTThirdPayMethodYSF:
        {
            NSArray *arr =@[@"uppaysdk",@"uppaywallet",@"uppayx1",@"uppayx2",@"uppayx3"];
            __block BOOL ysf;
            [arr enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                BOOL YSF = NO;
                NSURL *url =[NSURL URLWithString:[NSString stringWithFormat:@"%@://",obj]];
                YSF = [[UIApplication sharedApplication]canOpenURL:url];
                ysf = YSF;
                if (YSF) {
                    ysf =YSF;
                    *stop = YES;
                }
            }];
            return ysf;
        }
            break;
            
        default:
            break;
    }
    return YES;
}


//直接跳转到appstore 下载云闪付 支付宝和微信
+ (void)downLoadAppWithType:(PTThirdPayMethod)mtd {
    switch (mtd) {
        case PTThirdPayMethodWX:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://apps.apple.com/cn/app/id414478124"]];
        }
            break;
            
        case PTThirdPayMethodALIPAY:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://apps.apple.com/cn/app/zhi-fu-bao-rang-sheng-huo/id333206289"]];
        }
            break;
            
        case PTThirdPayMethodYSF:
        {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://apps.apple.com/cn/app/%E9%93%B6%E8%81%94%E9%92%B1%E5%8C%85/id600273928"]];
        }
            break;
            
        default:
            break;
    }
}


//打开
+ (void)openThirdPayMethodLanuch:(PTThirdPayMethod)mtd {
    switch (mtd) {
        case PTThirdPayMethodWX:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weixin://"]];
        }
            break;
            
        case PTThirdPayMethodALIPAY:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"alipay://"]];
        }
            break;
            
        case PTThirdPayMethodYSF:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"uppaywallet://"]];
        }
            break;
            
        default:
            break;
    }
}


//获取当前请求的url Host
+ (NSArray*)getCurrentReqEVN {
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    NSArray *urlTypes = dict[@"NETReqMent"];
    return urlTypes;
}


+ (void) animationAlert:(UIView *)view tpView:(UIView*)tp
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration =0.45;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    view.frame=CGRectMake(tp.frame.origin.x, tp.frame.origin.y, tp.width, tp.height);
    [view.layer addAnimation:popAnimation forKey:nil];
    //弹出放大-缩小效果
    
}


@end
