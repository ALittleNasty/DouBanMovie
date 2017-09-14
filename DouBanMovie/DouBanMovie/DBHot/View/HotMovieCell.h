//
//  HotMovieCell.h
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/13.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Subject;

extern NSString *HotMovieCellID;

@protocol HotMovieCellDelegate <NSObject>

@required
- (void)hotMovieCellPayButtonClick;

@end

@interface HotMovieCell : UITableViewCell

/** 代理 */
@property (nonatomic, weak) id <HotMovieCellDelegate> delegate;

/** 数据模型 */
@property (nonatomic, strong) Subject *model;

+ (UINib *)nib;

@end
