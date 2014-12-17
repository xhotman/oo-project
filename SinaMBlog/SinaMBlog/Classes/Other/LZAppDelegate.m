 //
//  LZAppDelegate.m
//  SinaWeibo
//
//  Created by mac on 14-12-9.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "LZAppDelegate.h"
#import "LZRootController.h"
#import "LZOauthViewController.h"

@implementation LZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //跳转根控制器,分两种情况:
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *filePath = [docPath stringByAppendingPathComponent:@"account.plist"];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/account.plist", NSHomeDirectory()];
    NSDictionary *account = [NSDictionary dictionaryWithContentsOfFile:filePath];
    LZLog(@"AppDelegate - %@", account);
    
    if (account) {
        self.window.rootViewController = [[LZRootController alloc] init];
    }else{
        self.window.rootViewController = [[LZOauthViewController alloc] init];
    }
    
//    self.window.rootViewController = [[LZRootController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
