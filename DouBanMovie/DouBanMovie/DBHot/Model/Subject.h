//
//  Subject.h
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/13.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubjectRating.h"
#import "SubjectImages.h"
#import "SubjectDirector.h"

@interface Subject : NSObject

@property (nonatomic, strong) SubjectRating *rating;

@property (nonatomic, copy) NSArray *genres;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSArray *casts;

@property (nonatomic, copy) NSArray *durations;

@property (nonatomic, copy) NSString *collect_count;

@property (nonatomic, copy) NSString *mainland_pubdate;

@property (nonatomic, copy) NSString *has_video;

@property (nonatomic, copy) NSString *original_title;

@property (nonatomic, copy) NSString *subtype;

@property (nonatomic, copy) NSArray <SubjectDirector *>*directors;

@property (nonatomic, copy) NSArray *pubdates;

@property (nonatomic, copy) NSString *year;

@property (nonatomic, strong) SubjectImages *images;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *ID;

@end
