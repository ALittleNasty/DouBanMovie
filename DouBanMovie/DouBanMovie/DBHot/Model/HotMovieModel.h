//
//  HotMovieModel.h
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/13.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"

@interface HotMovieModel : NSObject

/** 个数 */
@property (nonatomic, assign) NSString *count;

/** 索引 */
@property (nonatomic, assign) NSString *start;

/** 本次返回总个数 */
@property (nonatomic, assign) NSString *total;

/** 标题 */
@property (nonatomic, strong) NSString *title;

/** 电影列表 */
@property (nonatomic, copy) NSArray <Subject *>*subjects;

@end
