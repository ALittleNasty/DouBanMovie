//
//  SubjectRating.h
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/13.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubjectRating : NSObject

@property (nonatomic, copy) NSString *max;

@property (nonatomic, copy) NSString *average;

@property (nonatomic, copy) NSDictionary *details;

@property (nonatomic, copy) NSString *stars;

@property (nonatomic, copy) NSString *min;

@end
