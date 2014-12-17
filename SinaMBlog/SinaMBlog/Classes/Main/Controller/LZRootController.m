//
//  LZRootController.m
//  SinaWeibo
//
//  Created by mac on 14-12-9.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZRootController.h"
#import "LZHomeViewController.h"
#import "LZDiscoverViewController.h"
#import "LZMessageViewController.h"
#import "LZProfileViewController.h"
#import "LZTabBar.h"



@interface LZRootController ()

@end

@implementation LZRootController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addVCWithClass:[LZHomeViewController class] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    LZDiscoverViewController *discover = [[LZDiscoverViewController alloc] init];
    discover.view.backgroundColor = [UIColor grayColor];
    
    [self addVCWithObjc:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    [self addVCWithClass:[LZMessageViewController class] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    [self addVCWithClass:[LZProfileViewController class] title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];

    [self setValue:[[LZTabBar alloc] init] forKeyPath:@"tabBar"];
}




/**
 *  添加子控制器
 *  @param  class :  子控制器类名
 *
 */
- (void)addVCWithClass:(Class)class  title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UITableViewController *vc = [[class alloc] init];
    vc.view.backgroundColor = LZRandomColor;
//    vc.tabBarItem.title = title;  //TabBar上的title
//    vc.navigationItem.title = title;  //导航控制器title
    vc.title = title;  //两个title一起设置
    
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:@{
                                               NSForegroundColorAttributeName:[UIColor orangeColor],
//                                               NSFontAttributeName:[UIFont systemFontOfSize:16]
                                               } forState:UIControlStateNormal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}




/**
 *  添加子控制器
 *  @param  objc :  子控制器对象
 *
 */
- (void)addVCWithObjc:(UIViewController *)objc  title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
//    vc.view.backgroundColor = [UIColor orangeColor];
    objc.tabBarItem.title = title;
    objc.navigationItem.title = title;  //导航控制器title
    objc.tabBarItem.image = [UIImage imageNamed:image];
    objc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [objc.tabBarItem setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName:[UIColor orangeColor],
//                                               NSFontAttributeName:[UIFont systemFontOfSize:16]
                                            } forState:UIControlStateNormal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:objc];
    [self addChildViewController:nav];
}







@end
