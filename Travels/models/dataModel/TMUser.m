//
//  TMUser.m
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMUser.h"
#import "DZSingletonFactory.h"

INIT_DZ_EXTERN_STRING(kTMUserName, name);
INIT_DZ_EXTERN_STRING(kTMUserEmail, email);
INIT_DZ_EXTERN_STRING(kTMUserPhoneNumber, phoneNumber);

@implementation TMUser
+ (TMUser*) userWithDictionary:(NSDictionary *)dic
{
    TMUser* user = [TMUser new];
    [user setValuesForKeysWithDictionary:dic];
    return user;
}

+ (TMUser*) unknowUser
{
    static TMUser* unknowUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unknowUser = [self userWithDictionary:@{kTMUserPhoneNumber: @"000-00000000000",
                                                kTMUserEmail:@"unknow@travels.com",
                                                kTMUserName: @"unkonw"}];
    });
    return unknowUser;
}

- (void) setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:kTMUserName]) {
        [self setName:value];
    } else if ([key isEqualToString:kTMUserEmail]) {
        [self setEmail:value];
    } else if ([key isEqualToString:kTMUserPhoneNumber]) {
        [self setPhoneNumber:value];
    }
}
@end
