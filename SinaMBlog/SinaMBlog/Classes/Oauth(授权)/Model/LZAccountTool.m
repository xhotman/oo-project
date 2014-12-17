//
//  LZAccountTool.m
//  SinaMBlog
//
//  Created by mac on 14-12-17.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LZAccountTool.h"


@implementation LZAccountTool

+ (void)save:(LZAccount *)account
{
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/account.data", NSHomeDirectory()];
    BOOL isSaved = [NSKeyedArchiver archiveRootObject:account toFile:filePath];
    LZLog(@"%@", isSaved?@"保存成功!":@"保存失败!");
}


+ (LZAccount *)account
{
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/account.data", NSHomeDirectory()];
    //解档后,返回对象类型为id,强转一下,方便后续使用
    LZAccount *account = (LZAccount *)[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return account;
}


@end
