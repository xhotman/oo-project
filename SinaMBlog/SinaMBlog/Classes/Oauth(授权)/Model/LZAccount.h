//
//  LZAccount.h
//  SinaMBlog
//
//  Created by mac on 14-12-17.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZAccount : NSObject<NSCoding>

@property (copy, nonatomic) NSString *access_token;
@property (strong, nonatomic) NSNumber *expires_in; //plist中为Number类型,注意转化一下
@property (copy, nonatomic) NSString *remind_in;
@property (copy, nonatomic) NSString *uid;

+ (instancetype)accountWithDic:(NSDictionary *)dict;

@end
