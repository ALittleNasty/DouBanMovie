//
//  DBHttpTool.m
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/11.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "DBHttpTool.h"
#import <AFNetworking.h>

@implementation DBHttpTool

+(void)get:(NSString *)URLString parameters:(id)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr GET:URLString parameters:params progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
} 

@end
