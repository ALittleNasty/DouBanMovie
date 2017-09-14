//
//  DBHotMovieController.m
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/11.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "DBHotMovieController.h"
#import "DouBanApi.h"
#import "DBMacro.h"
#import "DBHttpTool.h"
#import "HotMovieModel.h"
#import "HotMovieCell.h"
#import "DBMovieDetailController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <MJExtension/MJExtension.h>

@interface DBHotMovieController ()<UITableViewDelegate, UITableViewDataSource, HotMovieCellDelegate>

/** 列表 */
@property (nonatomic, strong) UITableView *tableView;

/** 模型 */
@property (nonatomic, strong) HotMovieModel *model;

/** 电影列表 */
@property (nonatomic, copy) NSArray *movieList;

@end

@implementation DBHotMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSubview];
    
    [self requestMovieListData];
}

#pragma mark - Init Subview

- (void)initSubview
{
    self.navigationItem.title = @"正在热映";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGRect frame = CGRectMake(0.0, 0.0, kScreenWidth, kScreenHeight - 64.0 - 49.0);
    _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 150.0;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[HotMovieCell nib] forCellReuseIdentifier:HotMovieCellID];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movieList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:HotMovieCellID forIndexPath:indexPath];
    cell.model = self.movieList[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DBMovieDetailController *detailVC = [[DBMovieDetailController alloc] init];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - HotMovieCellDelegate

- (void)hotMovieCellPayButtonClick
{
    
}

#pragma mark - Http Request

- (void)requestMovieListData
{
    [SVProgressHUD show];
    
    __weak typeof(self) weakSelf = self;
    NSString *urlString = @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E4%B8%8A%E6%B5%B7&start=0&count=100&client=&udid=";
    
    [DBHttpTool get:urlString parameters:nil success:^(id result) {
        
        [SVProgressHUD dismiss];
        weakSelf.model = [HotMovieModel mj_objectWithKeyValues:result];
        weakSelf.movieList = [Subject mj_objectArrayWithKeyValuesArray:result[@"subjects"]];
        [weakSelf.tableView reloadData];
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}

@end
