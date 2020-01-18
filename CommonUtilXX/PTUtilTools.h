//
//  PTUtilTools.h
//  PlatformTop
//
//  Created by Jack on 12/6/19.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, PTThirdPayMethod) {
     PTThirdPayMethodWX,
     PTThirdPayMethodALIPAY,
     PTThirdPayMethodYSF,
 };
@interface PTUtilTools : NSObject
//将文字range色值
+ (NSMutableAttributedString*)rangeStrBackTotalStr:(NSString*)tStr rgStr:(NSString*)rStr  color:(UIColor*)clo;

//将文字range色值
+ (NSMutableAttributedString*)rangeStrBackTotalStr:(NSString*)tStr rang:(NSRange)range  color:(UIColor*)clo;

//将文字range色值 大小
+ (NSMutableAttributedString*)rangeStrFontBackTotalStr:(NSString*)tStr rgStr:(NSString*)rStr   color:(UIColor*)clo font:(UIFont*)font;

//计算文字宽度
+ (CGFloat)calculateRowWidth:(NSString *)string;


+ (void)jianbianAction:(UIView*)V leftOrUp:(BOOL)direction startColor:(UIColor*)startcol stopColor:(UIColor*)stopCol;

//将文字添加下划线
+ (NSMutableAttributedString*)rangeStrSubLineBackTotalStr:(NSString*)tStr rgStr:(NSString*)rStr  color:(UIColor*)clo;


//textfield添加placeholder
+ (NSMutableAttributedString*)tefChangePlaceHolder:(NSString*)tStr  color:(UIColor*)clo;

//将文字添加下划线
+ (NSMutableAttributedString*)rangeStrSubLineBackTotalStr:(NSString*)tStr rgStr:(NSString*)rStr  color:(UIColor*)clo;

//textfield添加placeholder
+ (NSMutableAttributedString*)tefChangePlaceHolder:(NSString*)tStr  color:(UIColor*)clo ;

//视图添加圆角
+ (void)viewChoiceWitchCorner:(UIView*)v coner:(UIRectCorner)coner sz:(float)sz;
//texfield添加左边间距和图片
+ (void)tefLeftSpace:(UITextField*)tef foffset:(float)x  img:(NSString*)imgStr;
//判断是否安装 云闪付 支付宝 微信的判断
+ (BOOL)thirdPayMethodLanuch:(PTThirdPayMethod)mtd;

//直接跳转到appstore 下载云闪付 支付宝和微信
+ (void)downLoadAppWithType:(PTThirdPayMethod)mtd;

//打开
+ (void)openThirdPayMethodLanuch:(PTThirdPayMethod)mtd;

//获取当前请求的url Host
+ (NSArray*)getCurrentReqEVN;

//动画效果的添加 弹出框
+ (void) animationAlert:(UIView *)view tpView:(UIView*)tp;


@end

NS_ASSUME_NONNULL_END
