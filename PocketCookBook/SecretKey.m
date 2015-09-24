//
//  SecretKey.m
//  test1
//
//  Created by 马鸣坤 on 15/9/22.
//  Copyright (c) 2015年 sdzy. All rights reserved.
//

#import "SecretKey.h"
#import <CommonCrypto/CommonDigest.h>

@implementation SecretKey
-(instancetype)initWithParam:(NSDictionary *)param andSecret:(NSString *)secret{
    self = [super init];
    if (self) {
        self.param=param;
        self.secret=secret;
    }
    return self;
}
-(NSString *)receiveKey{
    NSMutableString *key=[NSMutableString stringWithCapacity:0];
    NSMutableArray *keyArray=[NSMutableArray arrayWithArray:[self.param allKeys]];
    [keyArray sortUsingSelector:@selector(compare:)];
    for (NSString *akey in keyArray) {
        [key appendFormat:@"%@%@",akey,self.param[akey]];
    }
    [key appendFormat:@"%@",self.secret];
    return [SecretKey md5:key];
}
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
