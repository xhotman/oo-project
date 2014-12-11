//
//  UIBarButtonItem+Extension.h
//  SinaMBlog
//
//  Created by mac on 14-12-11.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithBg:(NSString *)bg BgSelected:(NSString *)bgSelected action:(SEL)action target:(id)target;


@end
