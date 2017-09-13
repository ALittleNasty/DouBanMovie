//
//  SubjectDirector.h
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/13.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Avatar.h"

@interface SubjectDirector : NSObject

@property (nonatomic, strong) Avatar *avatars;

@property (nonatomic, copy) NSString *name_en;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *ID;

@end
