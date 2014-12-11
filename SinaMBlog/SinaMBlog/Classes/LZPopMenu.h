//
//  LZPopMenu.h
//  SinaMBlog
//
//  Created by mac on 14-12-11.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LZPopMenu : NSObject

//+ (void)popFrom:(UIView *)from content:(UIView *)contentView ;
//+ (void)popFrom:(UIView *)from content:(UIView *)contentView dismiss:(void(^)())dismiss;
//+ (void)popFromRect:(CGRect)rect inView:(UIView *)view content:(UIView *)content dismiss:(void(^)())dismiss;

+ (void)popFrom:(UIView *)from content:(UIView *)content dismiss:(void (^)())dismiss;
+ (void)popFrom:(UIView *)from rect:(CGRect)rect content:(UIView *)content dismiss:(void(^)())dismiss;

@end
