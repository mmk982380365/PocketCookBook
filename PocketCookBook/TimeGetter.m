//
//  TimeGetter.m
//  test1
//
//  Created by 马鸣坤 on 15/9/22.
//  Copyright (c) 2015年 sdzy. All rights reserved.
//

#import "TimeGetter.h"

@implementation TimeGetter
+(NSString *)getTimeNow{
    NSDate *dates=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GTM"]];
    NSString *timeFormat=[formatter stringFromDate:dates];
    return timeFormat;
}
@end
