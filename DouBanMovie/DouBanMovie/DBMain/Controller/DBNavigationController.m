//
//  DBNavigationController.m
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/11.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "DBNavigationController.h"
#import "DBUtil.h"

@interface DBNavigationController ()

@end

@implementation DBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationBar setBackgroundImage:[DBUtil imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self.navigationBar setShadowImage:[DBUtil imageWithColor:[UIColor whiteColor]]];
    
    //设置整个项目的item状态
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置item普通状态
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
}

@end
