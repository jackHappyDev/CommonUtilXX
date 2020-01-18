 
#import "CountDownLayer.h"
@interface CountDownLayer ()
{
    UIImageView *bgimg1;
    UIImageView *bgimg;
}
@end
@implementation CountDownLayer

-(instancetype)initWithFrame:(CGRect)frame countDown:(NSInteger)times{
    
    self =[super initWithFrame:frame];
    bgimg1 = [UIImageView new];
    [self addSubview:bgimg1];
    bgimg1.frame =CGRectMake(-1, -1, frame.size.width+2, frame.size.height+2);
    bgimg1.image =[UIImage imageNamed:@"home_countDown_bg1"];
    bgimg = [UIImageView new];
    [self addSubview:bgimg];
    bgimg.image =[UIImage imageNamed:@"home_countDown_bg"];
    bgimg.frame =CGRectMake(-1, -1, frame.size.width+2, frame.size.height+2);
    [self setupUI:times];
    return self;
}

-(void)setupUI:(NSInteger)times {
    UIBezierPath *path =[UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.width/2-2.1 startAngle:-0.5*M_PI endAngle:1.5*M_PI clockwise:YES];
    CAShapeLayer *bgLayer =[CAShapeLayer layer];
    [self.layer addSublayer:bgLayer];
    bgLayer.path =path.CGPath;
    bgLayer.fillColor =[UIColor clearColor].CGColor;
    bgLayer.strokeColor =[UIColor clearColor].CGColor;
    bgLayer.lineWidth =3;
    arcLayer =[CAShapeLayer layer];
    arcLayer.path =path.CGPath;
    arcLayer.fillColor =[UIColor clearColor].CGColor;
    arcLayer.strokeColor =[UIColor colorWithHexString:@"#0a243f"].CGColor;
    arcLayer.lineWidth =3;
    arcLayer.frame =CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [self.layer addSublayer:arcLayer];
    
 
    countDownLab =[UILabel new];
    countDownLab.font =[UIFont boldSystemFontOfSize:14];
    [self addSubview:countDownLab];
    countDownLab.frame =CGRectMake(0, (self.frame.size.height-42)/2, self.frame.size.width, 42);
    countDownLab.textColor =[UIColor colorWithHexString:@"#dac199"];
    countDownLab.textAlignment =NSTextAlignmentCenter;
    countDownLab.text = [NSString stringWithFormat:@"%d",times];
 
    countDown =times;
    [self drawLineAnimation:arcLayer withTime:times];
    
}
 
-(void)drawLineAnimation:(CALayer*)layer withTime:(NSInteger)times

{
    
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    bas.duration=times;
    
    bas.delegate=self;
    
    bas.fromValue=[NSNumber numberWithInteger:0];
    
    bas.toValue=[NSNumber numberWithInteger:1];
    
    [layer addAnimation:bas forKey:@"key"];
 
}

- (void)animationDidStart:(CAAnimation *)anim {
 
    timer= [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES];
    // 正常触发
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

//倒计时暂停
- (void)countDownLayerZT {
    [timer setFireDate:[NSDate distantFuture]];

}
//倒计时继续
- (void)countDownLayerJX {
  [timer setFireDate:[NSDate date]];
}

//清除当前layer
- (void)countDownDistory {
    [timer invalidate];
    timer =nil;
    [self removeFromSuperview];
}

- (void)countDownAction {
    bgimg1.image =[UIImage imageNamed:@"home_countDown_bg1"];
    bgimg.image =[UIImage imageNamed:@"home_countDown_bg"];
    countDown --;
    countDownLab.text =[NSString stringWithFormat:@"%ld",(long)countDown];
    if (countDown <1) {
        [timer invalidate];
        timer =nil;
        if (_finlishAction) {
            if (self) {
                [self removeFromSuperview];
            }
            _finlishAction();
        }
    } else {
        if (_currentidxAction) {
            _currentidxAction(countDown);
        }
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (flag) {
        if (_finlishAction) {
            [self removeFromSuperview];
            _finlishAction();
        }
    }
}
 
@end
