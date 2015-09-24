//
//  SecretKey.h
//  test1
//
//  Created by 马鸣坤 on 15/9/22.
//  Copyright (c) 2015年 sdzy. All rights reserved.
//

#import <Foundation/Foundation.h>
//showapi.com md5算法
@interface SecretKey : NSObject
@property(strong,nonatomic) NSDictionary *param;
@property(strong,nonatomic) NSString *secret;
-(instancetype)initWithParam:(NSDictionary *)param andSecret:(NSString *)secret;
-(NSString *)receiveKey;
@end
