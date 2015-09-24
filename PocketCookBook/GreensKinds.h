//
//  GreensKinds.h
//  test1
//
//  Created by 马鸣坤 on 15/9/23.
//  Copyright (c) 2015年 sdzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecretKey.h"
#import "TimeGetter.h"
typedef void(^getDic) (NSDictionary *dic);
typedef void(^getErr) (NSString *errors);
@interface GreensKinds : NSObject
+(void)getGreensKingByString:(NSString *)string byBlock:(getDic)block failure:(getErr)errors;
@end
