//
//  DBTabBarController.m
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/11.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "DBTabBarController.h"
#import "DBNavigationController.h"
#import "DBHotMovieController.h"
#import "DBDiscoveryController.h"
#import "DBProfileController.h"

@interface DBTabBarController ()

@end

@implementation DBTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *titleArray = @[@"热映",@"找片",@"我的"];
        NSArray *normalImages = @[@"ic_tab_hot_gray", @"ic_tab_discover_gray", @"ic_tab_profile_gray"];
        NSArray *selectedImage = @[@"ic_tab_hot_black", @"ic_tab_discover_black", @"ic_tab_profile_black"];
        NSArray *classArray = @[NSStringFromClass([DBHotMovieController class]),
                                NSStringFromClass([DBDiscoveryController class]),
                                NSStringFromClass([DBProfileController class])];
        
        
        self.viewControllers = [self tabBarViewControllers:classArray barTitles:titleArray barImageNormal:normalImages barImageSelected:selectedImage] ;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)tabBarViewControllers:(NSArray *)classNameArr barTitles:(NSArray *)barTitleArr barImageNormal:(NSArray *)imageNormal barImageSelected:(NSArray *)imageSet
{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:classNameArr.count];
    for (int i = 0 ; i < classNameArr.count ; i++)
    {
        NSString *str = [classNameArr objectAtIndex:i];
        NSString *barTitle = [barTitleArr objectAtIndex:i];
        if (NSClassFromString(str)) {
            UIViewController *vc = [[NSClassFromString(str) alloc] init];
            
            UIImage *normalImage = [UIImage imageNamed:imageNormal[i]] ;
            vc.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UIImage *selectedImage = [UIImage imageNamed:imageSet[i]] ;
            vc.tabBarItem.selectedImage =[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            vc.tabBarItem.title = barTitle;
            
            [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateSelected];
            [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
            
            DBNavigationController *navi = [[DBNavigationController alloc]initWithRootViewController:vc];
            [array addObject:navi];
        }
    }
    return array;
}

@end
