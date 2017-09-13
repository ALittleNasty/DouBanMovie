//
//  DBHotMovieController.m
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/11.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "DBHotMovieController.h"
#import "DouBanApi.h"
#import "DBHttpTool.h"
#import "HotMovieModel.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <MJExtension/MJExtension.h>

@interface DBHotMovieController ()

/** 电影列表 */
@property (nonatomic, copy) NSArray *movieList;

/** 模型 */
@property (nonatomic, strong) HotMovieModel *model;

@end

@implementation DBHotMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self requestMovieListData];
}

- (void)requestMovieListData
{
    [SVProgressHUD show];
    
    NSString *urlString = @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E4%B8%8A%E6%B5%B7&start=0&count=100&client=&udid=";
    
    [DBHttpTool get:urlString parameters:nil success:^(id result) {
        
        [SVProgressHUD dismiss];
        self.model = [HotMovieModel mj_objectWithKeyValues:result];
        NSLog(@"%@",result);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}

@end
