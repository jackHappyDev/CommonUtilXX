//
//  PTNeedSpeed.m
//  PlatformTop
//
//  Created by Jack on 15/10/2019.
//  Copyright © 2019 liuyun. All rights reserved.
//

#import "PTNeedSpeed.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
#import "STDPingServices.h"
@interface PTNeedSpeed ()
@property (nonatomic,strong) NSTimer *lyTimer;
@property (nonatomic,strong) STDPingServices *p;
@end

@implementation PTNeedSpeed

+ (id)sharedInstance
{
    static PTNeedSpeed * speed;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        speed = [[PTNeedSpeed alloc] init];
    });
    return speed;
}

- (void)startNeetSpeed:(void(^)(NSString*speed,NSInteger ispeed))speedBack{
    _lyTimer =[NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self getYanChi:^(NSString *yanchi) {
            speedBack(yanchi,[yanchi intValue]);
        }];
    }];
     [[NSRunLoop currentRunLoop] addTimer:_lyTimer forMode:NSRunLoopCommonModes];
   

}

- (void)stop {
    [_lyTimer invalidate];
    [_p cancel];
}

- (void)getYanChi:(void(^)(NSString*yanchi))block{
       _p = [STDPingServices startPingAddress:@"www.baidu.com" callbackHandler:^(STDPingItem *pingItem, NSArray *pingItems) {
            if (pingItem.status != STDPingStatusFinished) {
                if ( pingItem.timeMilliseconds>0) {
                     block([NSString stringWithFormat:@"%.0fms", pingItem.timeMilliseconds]);
                }
            }else {
                //NSLog(@"%@", [STDPingItem statisticsWithPingItems:pingItems]);
            }
           
        }];

}






//






- (NSString*)getByteRate {
    long long intcurrentBytes = [self getInterfaceBytes];
    NSString *rateStr = [self formatNetWork:intcurrentBytes];
    return rateStr;
}

- (long long) getInterfaceBytes {
    struct ifaddrs *ifa_list = 0, *ifa;
    if (getifaddrs(&ifa_list) == -1) {
        return 0;
    }
    uint32_t iBytes = 0;
    uint32_t oBytes = 0;
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next) {
        if (AF_LINK != ifa->ifa_addr->sa_family)
            continue;
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
            continue;
        if (ifa->ifa_data == 0)
            continue;
        /* Not a loopback device. */
        if (strncmp(ifa->ifa_name, "lo", 2)){
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            iBytes += if_data->ifi_ibytes;
            
            oBytes += if_data->ifi_obytes;
        }
    }
    freeifaddrs(ifa_list);
//    NSLog(@"\n[getInterfaceBytes-Total]%d,%d",iBytes,oBytes);
    return iBytes + oBytes;
}

- (NSString *)formatNetWork:(long long int)rate {
    if (rate <1024) {
        return [NSString stringWithFormat:@"%lldB/s", rate];
    } else if (rate >=1024&& rate <1024*1024) {
        return [NSString stringWithFormat:@"%.0fKB/s", (double)rate /1024];
    } else if (rate >=1024*1024&& rate <1024*1024*1024) {
        return [NSString stringWithFormat:@"%.0fMB/s", (double)rate / (1024*1024)];
    } else {
        return@"10Kb/s";
    };
}
@end
