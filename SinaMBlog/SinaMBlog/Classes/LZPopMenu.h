//
//  LZPopMenu.h
//  SinaMBlog
//
//  Created by mac on 14-12-11.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LZPopMenu : NSObject

//传视图
+ (void)popFrom:(UIView *)from content:(UIView *)content dismiss:(void (^)())dismiss;
+ (void)popFrom:(UIView *)from rect:(CGRect)rect content:(UIView *)content dismiss:(void(^)())dismiss;

//传控制器
+ (void)popFrom:(UIView *)from contentVC:(UIViewController *)tableVC dismiss:(void (^)())dismiss;
+ (void)popFrom:(UIView *)from rect:(CGRect)rect contentVC:(UIViewController *)tableVC dismiss:(void(^)())dismiss;

@end
