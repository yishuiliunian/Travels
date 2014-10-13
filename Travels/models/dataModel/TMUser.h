//
//  TMUser.h
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMModelBase.h"

DEFINE_DZ_EXTERN_STRING(kTMUserName);
DEFINE_DZ_EXTERN_STRING(kTMUserEmail);
DEFINE_DZ_EXTERN_STRING(kTMUserPhoneNumber);

@interface TMUser : TMModelBase
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_STRONG_NSString(email);
DEFINE_PROPERTY_STRONG_NSString(phoneNumber);
+ (TMUser*) userWithDictionary:(NSDictionary*)dic;
+ (TMUser*) unknowUser;
@end
