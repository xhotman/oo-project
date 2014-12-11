//
//  LZTitleButton.m
//  SinaMBlog
//
//  Created by mac on 14-12-11.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZTitleButton.h"

@implementation LZTitleButton

// 方案一
// 两方法分别控制按钮内部标题和图片
//- (CGRect)titleRectForContentRect:(CGRect)contentRect{}
//- (CGRect)imageRectForContentRect:(CGRect)contentRect{}


//方案二
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = self.imageView.x;  //把标题换到图片位置. 系统按钮默认:图片左,文字右.
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;  //标题区域的最大x值, 给图片, 作为图片的起点x; +5修正一下;
}


//通过xib/storyboard创建时,会调用
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    
    return self;
}

//对象init方法, 会调用到此.
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}


//初始化按钮, 统一风格设置
- (void)setup
{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
}


//在控制器中[titleButton sizeToFit]
//如果网络有延迟,刚开始标题加载的是默认文字, 一旦加载好, 标题信息来了, 标题区域大小却没变.
//必须重新调用一次sizeToFit,让标题区域随信息多少改变一下大小.
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];   //怎么设置标题, 还是交给系统按钮对象去做
    [self sizeToFit];  //重写此方法, 相当于hook进去一个sizeToFit功能
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}
//这样每次有新title或image赋值, 就会自动调用sizeToFit调整文字图片区域大小, 以适应内容.

//不仅是UIButton, 像UITabBar, 如果需求的内部格局, 与系统的大不相同, 则要继承自UIView, 完全自定义!


@end
