//
//  SubjectDirector.m
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/13.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "SubjectDirector.h"
#import <MJExtension/MJExtension.h>

@implementation SubjectDirector

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID" : @"id"};
}

@end
