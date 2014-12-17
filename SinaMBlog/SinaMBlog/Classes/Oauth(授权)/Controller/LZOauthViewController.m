//
//  LZOauthViewController.m
//  SinaMBlog
//
//  Created by mac on 14-12-15.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZOauthViewController.h"
#import "AFNetworking.h"
#import "LZRootController.h"

@interface LZOauthViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation LZOauthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    //App Key：1169246534
    //App Secret：1776da5cce7bab99c96ab6f47322605b
    //授权回调地址：http://www.baidu.com
    
    self.webView.delegate = self;  //没有用"拖线"这种隐藏方式
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=1169246534&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    LZLog(@"%@",urlStr);
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code = [urlStr substringFromIndex:(range.location + range.length)];
        LZLog(@"%@",code);
        [self accessTokenWithCode:code];
        return NO;
    }
//    return NO;
    return YES;
}

- (void)accessTokenWithCode:(NSString *)code
{
    //拼接请求字串
    NSMutableString *postString = [[NSMutableString alloc] init];
    [postString appendString:@"https://api.weibo.com/oauth2/access_token"];
    [postString appendString:@"?client_id=1169246534"];
    [postString appendString:@"&client_secret=1776da5cce7bab99c96ab6f47322605b"];
    [postString appendString:@"&grant_type=authorization_code"];
    [postString appendString:[NSString stringWithFormat:@"&code=%@",code]];
    [postString appendString:@"&redirect_uri=http://www.baidu.com"];
    //查看http请求字串
    LZLog(@"%@",postString);
    
    //    NSData *qData = [postString dataUsingEncoding:NSUTF8StringEncoding];
    //    NSString *length = [NSString stringWithFormat:@"%d", [qData length]];
    
    
    //转为URL
    NSURL *url = [NSURL URLWithString:postString];
    //创建可变请求对象
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:10.0];
    //POST方式
    [mRequest setHTTPMethod:@"POST"];
    //请求头
    [mRequest setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    //    [mRequest setValue:length forHTTPHeaderField:@"Content-Length"];
    //请求体
    //    [mRequest setHTTPBody:qData];
    
    //问题就在这里!
    //新浪个傻逼,要求用户发post请求,那么重要参数居然放到http地址中,请求体是空的!发post请求,有毛意义!
    //
    
    [NSURLConnection sendAsynchronousRequest:mRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSLog(@"服务器响应 - %@",response);
        
        NSArray *a = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"返回数据 - %@",a);
        
        //测试了一下, 成功跳转到主页控制器界面!
        [UIApplication sharedApplication].keyWindow.rootViewController = [[LZRootController alloc] init];
    }];
    
    return;
}



- (void)accessTokenWithCode2:(NSString *)code
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"1169246534";
    params[@"client_secret"] = @"1776da5cce7bab99c96ab6f47322605b";
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = @"http://wwww.baidu.com";
    
    LZLog(@"%@",params);
    
    //AFN框架,把params最终作为[NSJSONSerialization dataWithJSONObject:params ...]参数传入,返回的data用来设置setHTTPBody.
    //很明显, 不是新浪傻瓜服务器期待的! 它要求用POST方式, 但HTTPBody为空,所有参数放到http地址中传送! 这跟GET有何区别?
    //也许是开发者测试账号, 所有没有保密的必要.且用GET方式,服务器解析不费劲, 反正是免费给开发者使用的, 何必要费劲去保密呢.
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        LZLog(@"请求成功 - %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        LZLog(@"请求失败 - %@", error);
    }];
    
}


@end



