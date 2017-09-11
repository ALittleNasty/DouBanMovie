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

+(void)get:(NSString *)URLString parameters:(id)params showLoading:(BOOL)yesOrNo success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *mgr = [DBHttpTool db_defaultManager];
    
    [mgr GET:URLString parameters:params progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (AFHTTPSessionManager *)db_defaultManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer.timeoutInterval = 60.0;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // https适配
    //    manager.securityPolicy = [self customSecurityPolicy];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone] ;
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml"]];
    
    return manager ;
}

@end
