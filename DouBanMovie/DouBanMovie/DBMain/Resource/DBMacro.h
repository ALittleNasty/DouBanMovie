//
//  DBMacro.h
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/14.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#ifndef DBMacro_h
#define DBMacro_h


// 屏幕相关
#define kAppWindow      [UIApplication sharedApplication].keyWindow
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenBounds   [UIScreen mainScreen].bounds

// 自定义log日志
#ifdef DEBUG
#define LRString [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define DLog(...) printf("%s 第%d行: %s\n\n", [LRString UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
#define DLog(...) do { } while (0)
#endif

#endif /* DBMacro_h */
