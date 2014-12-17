//
//  LZPopMenu.m
//  SinaMBlog
//
//  Created by mac on 14-12-11.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZPopMenu.h"
#import "LZTitleButton.h"


@implementation LZPopMenu

//全局变量
UIButton *_cover;
UIImageView *_container;
void(^_dismiss)();
UIViewController *_tableVC;

//改为:类方法
+ (void)popFrom:(UIView *)from content:(UIView *)content dismiss:(void (^)())dismiss
{
    [self popFrom:from rect:from.bounds content:content dismiss:dismiss];
}


+ (void)coverClick:(UIView *)from
{
    [_cover removeFromSuperview];
    _cover = nil;  //释放蒙版对象
    [_container removeFromSuperview];
    _container = nil;  //释放弹出框容器对象
    
    _tableVC = nil; //释放菜单控制器
    
    if (_dismiss) {
        _dismiss(@"翻转箭头!");
        _dismiss = nil;   //调用完,释放掉该block代码块!
    }
}


+ (void)popFrom:(UIView *)from rect:(CGRect)rect content:(UIView *)content dismiss:(void(^)())dismiss
{
//    _dismiss = dismiss;
    _dismiss = [dismiss copy];  //Block此时还是函数参数,还在栈里,用copy方法拷贝进堆里, 且用强指针引用着它,才能保留下来!
    
    //最上面的窗口
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    
    //蒙版
    _cover = [[UIButton alloc] init];
    _cover.backgroundColor = [UIColor blackColor];
    _cover.alpha = 0.5;
    _cover.frame = [UIScreen mainScreen].bounds;
    [_cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:_cover];
    
    
    //弹出框-容器
    _container = [[UIImageView alloc] init];
    _container.userInteractionEnabled = YES; //开启交互, 拦截点击事件,不让容器区域的点击事件传到蒙版上.
    _container.image = [UIImage imageNamed:@"popover_background"];
    
        //弹出框-内容
        content.x = 10;
        content.y = 15;
        [_container addSubview:content];
    
    //计算容器大小
    _container.width = CGRectGetMaxX(content.frame) + content.x;
    _container.height = CGRectGetMaxY(content.frame) + content.x;
    
    //计算容器位置
    _container.centerX = CGRectGetMidX(rect);
    _container.y = CGRectGetMaxY(rect);
    _container.center = [from convertPoint:_container.center toView:window];
    //容器放到窗口上,在蒙版之上!
    [window addSubview:_container];
    
}

+ (void)popFrom:(UIView *)from contentVC:(UIViewController *)tableVC dismiss:(void (^)())dismiss
{
    _tableVC = tableVC;
    [self popFrom:from content:_tableVC.view dismiss:dismiss];
}

+ (void)popFrom:(UIView *)from rect:(CGRect)rect contentVC:(UIViewController *)tableVC dismiss:(void(^)())dismiss
{
    _tableVC = tableVC;
    [self popFrom:from rect:rect content:_tableVC.view dismiss:dismiss];
}



@end
