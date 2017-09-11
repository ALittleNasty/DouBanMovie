//
//  DBHttpTool.h
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/11.
//  Copyright © 2017年 ALittleNasty. All rights reserved.

/**
 *  http请求的工具类
 */
#import <Foundation/Foundation.h>

@interface DBHttpTool : NSObject

+ (void)get:(NSString *)URLString parameters:(id)params showLoading:(BOOL)yesOrNo success:(void(^)(id result))success failure:(void (^)(NSError *error))failure ;

@end
