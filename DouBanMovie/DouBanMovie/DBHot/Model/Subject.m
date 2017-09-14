//
//  Subject.m
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/13.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "Subject.h"
#import <MJExtension/MJExtension.h>

@implementation Subject

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID" : @"id"};
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{ @"casts" : @"SubjectDirector",
              @"directors" : @"SubjectDirector" };
}

@end
