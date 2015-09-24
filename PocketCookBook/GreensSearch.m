//
//  GreensSearch.m
//  test1
//
//  Created by 马鸣坤 on 15/9/22.
//  Copyright (c) 2015年 sdzy. All rights reserved.
//

#import "GreensSearch.h"

@implementation GreensSearch
+(void)getSearchGreensByString:(NSString *)string byBlock:(getDic)block failure:(getErr)errors{
    __block NSDictionary *greens;
    NSString *baseUrl=@"http://route.showapi.com/95-106";
    NSDictionary *dic=@{@"showapi_appid":@"8552",@"showapi_timestamp":[TimeGetter getTimeNow],@"name":string};
    SecretKey *sec=[[SecretKey alloc] initWithParam:dic andSecret:@"ec0b630d007645d2b38676a621a69254"];
    NSString *sign=[sec receiveKey];
    NSMutableString *detailUrl=[NSMutableString stringWithCapacity:0];
    for (NSString *key in dic.allKeys) {
        [detailUrl appendFormat:@"%@=%@&",key,dic[key]];
    }
    [detailUrl appendFormat:@"showapi_sign=%@",sign];
    NSString *pathUrl=[[NSString stringWithFormat:@"%@?%@",baseUrl,detailUrl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:pathUrl];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        __autoreleasing NSError *error;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        if ([dic[@"showapi_res_code"] intValue]==0) {
            greens=dic[@"showapi_res_body"];
            block(greens);
        }else{
            errors(dic[@"showapi_res_error"]);
        }
    }];
}
+(void)getSearchGreensByString:(NSString *)string withType:(NSString *)type byBlock:(getDic)block failure:(getErr)errors{
    __block NSDictionary *greens;
    NSString *baseUrl=@"http://route.showapi.com/95-106";
    NSDictionary *dic=@{@"showapi_appid":@"8552",@"showapi_timestamp":[TimeGetter getTimeNow],@"name":string,@"type":type};
    SecretKey *sec=[[SecretKey alloc] initWithParam:dic andSecret:@"ec0b630d007645d2b38676a621a69254"];
    NSString *sign=[sec receiveKey];
    NSMutableString *detailUrl=[NSMutableString stringWithCapacity:0];
    for (NSString *key in dic.allKeys) {
        [detailUrl appendFormat:@"%@=%@&",key,dic[key]];
    }
    [detailUrl appendFormat:@"showapi_sign=%@",sign];
    NSString *pathUrl=[[NSString stringWithFormat:@"%@?%@",baseUrl,detailUrl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:pathUrl];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        __autoreleasing NSError *error;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        if ([dic[@"showapi_res_code"] intValue]==0) {
            greens=dic[@"showapi_res_body"];
            block(greens);
        }else{
            errors(dic[@"showapi_res_error"]);
        }
    }];
}
-(void)loadDataWithDic:(NSDictionary *)dic{
    
}
@end
