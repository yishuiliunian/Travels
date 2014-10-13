//
//  TMModelBase.m
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMModelBase.h"
INIT_DZ_EXTERN_STRING(kTMModelGuid, guid);
@implementation TMModelBase
- (void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:kTMModelGuid]) {
        [self setGuid:value];
    }
}
@end
