//
//  LZAccountTool.h
//  SinaMBlog
//
//  Created by mac on 14-12-17.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZAccount.h"

@interface LZAccountTool : NSObject

+ (void)save:(LZAccount *)account;
+ (LZAccount *)account;


@end
