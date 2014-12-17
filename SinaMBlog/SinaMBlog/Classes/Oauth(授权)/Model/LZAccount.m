//
//  LZAccount.m
//  SinaMBlog
//
//  Created by mac on 14-12-17.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZAccount.h"

@implementation LZAccount

//字典进来, 模型出去
+ (instancetype)accountWithDic:(NSDictionary *)dict
{
    LZAccount *account = [[self alloc] init];
    if (account) {
        account.access_token = dict[@"access_token"];
        account.expires_in   = dict[@"expires_in"];
        account.remind_in    = dict[@"remind_in"];
        account.uid          = dict[@"uid"];
    }
    return account;
}

//
//  归档解档 - 自定义模型
//
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.remind_in forKey:@"remind_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in   = [aDecoder decodeObjectForKey:@"expires_in"];
        self.remind_in    = [aDecoder decodeObjectForKey:@"remind_in"];
        self.uid          = [aDecoder decodeObjectForKey:@"uid"];
    }
    return self;
}


@end
