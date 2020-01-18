
#import <UIKit/UIKit.h>

@interface CountDownLayer : UIView <CAAnimationDelegate>
{
    CAShapeLayer *arcLayer;
    UILabel *countDownLab;
    NSInteger countDown;
    NSTimer *timer;
}
-(instancetype)initWithFrame:(CGRect)frame countDown:(NSInteger)times;
//倒计时暂停
- (void)countDownLayerZT;
//倒计时继续
- (void)countDownLayerJX;
//清除当前layer
- (void)countDownDistory;

@property (nonatomic,copy) void (^finlishAction)(void);
@property (nonatomic,copy) void (^currentidxAction)(NSInteger idx);

@end
