//
//  LZTabBar.m
//  SinaWeibo
//
//  Created by mac on 14-12-9.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZTabBar.h"


@interface LZTabBar()
@property (weak, nonatomic) UIButton *plusButton;

@end

@implementation LZTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setup];
    }
    return self;
}



- (void)setup
{
    UIButton *plusButton = [[UIButton alloc] init];
    plusButton.tag = 999;
//    plusButton.backgroundColor = [UIColor redColor];
    
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
//    plusButton.frame = CGRectMake(160, 0, 100, 100);
    
    [plusButton addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
    self.plusButton = plusButton;
    [self addSubview:plusButton];
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width / 5;
    CGFloat buttonH = self.frame.size.height;
    
    int buttonIndex = 0;
    
    for (UIView *child in self.subviews) {
        //排除+号按钮, 不在布局计算之列
        if ([child isKindOfClass:[UIControl class]] && child.tag != 999) {
            
            CGFloat buttonX = buttonW * buttonIndex;
            child.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
            buttonIndex++;
            if (buttonIndex==2) buttonIndex += 1;
        }
    }
    
    //根据按钮当前图片大小, 来设置+号按钮的大小和中心点.
//    CGSize plusButtonSize = self.plusButton.currentBackgroundImage.size;
//    self.plusButton.bounds = CGRectMake(0, 0, plusButtonSize.width, plusButtonSize.height);
//    self.plusButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}


- (void)plusClick
{
    NSLog(@"+++++++++++++");
}





@end
