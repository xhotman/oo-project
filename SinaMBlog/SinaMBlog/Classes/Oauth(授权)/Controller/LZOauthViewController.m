//
//  LZOauthViewController.m
//  SinaMBlog
//
//  Created by mac on 14-12-15.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZOauthViewController.h"
#import "LZRootController.h"
#import "LZAccount.h"
#import "LZAccountTool.h"

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
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code = [urlStr substringFromIndex:(range.location + range.length)];
        LZLog(@"code = %@",code);
        [self accessTokenWithCode:code];
        return NO;
    }
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
    
    //转为URL
    NSURL *url = [NSURL URLWithString:postString];
    //创建可变请求对象
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:10.0];
    //POST方式
    [mRequest setHTTPMethod:@"POST"];
    //请求头
    [mRequest setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    
    //问题就在这里!
    //新浪要求用户发post请求,那么重要参数居然放到http地址中,请求体是空的!发post请求,有毛意义!
    
    [NSURLConnection sendAsynchronousRequest:mRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        LZLog(@"服务器响应对象类型 - %@",NSStringFromClass([response class]));
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger status_code = [httpResponse statusCode];
        NSDictionary *headerFields = [httpResponse allHeaderFields];
        switch (status_code) {
            case 200:
                LZLog(@"请求成功 - %@", headerFields);
                break;
    
            default:
                LZLog(@"请求失败 - %@", headerFields);
                break;
        }
        
        
        //二进制数据,JSON格式对象, 转为一个字典
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        LZLog(@"access_token = %@", responseObject[@"access_token"]);
        //字典再转模型
        LZAccount *account = [LZAccount accountWithDic:responseObject];
        //模型归档, 到沙盒中, 为account.data文件
        [LZAccountTool save:account];
        //切换根控制器
        [UIApplication sharedApplication].keyWindow.rootViewController = [[LZRootController alloc] init];
    }];
}

@end



