//
//  UIBarButtonItem+Extension.m
//  SinaMBlog
//
//  Created by mac on 14-12-11.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithBg:(NSString *)bg BgSelected:(NSString *)bgSelected action:(SEL)action target:(id)target
{
    UIButton *aButton = [[UIButton alloc] init];
    [aButton setBackgroundImage:[UIImage imageNamed:bg] forState:UIControlStateNormal];
    [aButton setBackgroundImage:[UIImage imageNamed:bgSelected] forState:UIControlStateHighlighted];
    //    CGSize sizeL = leftButton.currentBackgroundImage.size;
    //    leftButton.bounds = CGRectMake(0, 0, sizeL.width, sizeL.height);
    aButton.size = aButton.currentBackgroundImage.size;
    [aButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:aButton];
}


@end
