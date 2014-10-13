//
//  TMResource.m
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMResource.h"
#import "NSObject+GlobalHelper.h"

#import "TMResImage.h"
#import "TMResText.h"
#import "TMResUnknow.h"

INIT_DZ_EXTERN_STRING(kTMResourceType, type);
INIT_DZ_EXTERN_STRING(kTMResourceCreateDate, createDate);
INIT_DZ_EXTERN_STRING(kTMResourceModifiedDate, modifiedDate);
INIT_DZ_EXTERN_STRING(kTMResourceLocalEdit, localEdit);
INIT_DZ_EXTERN_STRING(kTMResourceContent, content);

TMResourceType TMResourceTypeFromInt(int type) {
    switch (type) {
        case TMResourceText:
            return TMResourceText;
        case TMResourceAudio:
            return TMResourceAudio;
        case TMResourceImage:
            return TMResourceImage;
        case TMResourceVedio:
            return TMResourceVedio;
        default:
            return TMResourceUnkonw;
    }
}

@implementation TMResource

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    
    _localEdit = NO;
    
    return self;
}

- (void) setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:kTMResourceType]) {
        if (DZ_CheckObjcetClass(value, NSString) || DZ_CheckObjcetClass(value, NSNumber)) {
            int type = [value intValue];
            _type = TMResourceTypeFromInt(type);
        } else {
            _type = TMResourceUnkonw;
        }
    } else if ([key isEqualToString:kTMResourceCreateDate]) {
        [self setCreateDate:[value dateValue]];
    } else if ([key isEqualToString:kTMResourceModifiedDate]) {
        [self setModifiedDate:[value dateValue]];
    } else if ([key isEqualToString:kTMResourceLocalEdit]) {
        if (DZ_CheckObjcetClass(value, NSString) || DZ_CheckObjcetClass(value, NSNumber)) {
            _localEdit = [value boolValue];
        } else {
            _localEdit = NO;
        }
    } else if ([key isEqualToString:kTMResourceContent]) {
        [self setContent:value];
    }
}

+ (TMResource*) resourceWithDictionary:(NSDictionary *)dic
{
    TMResourceType type = TMResourceTypeFromInt([dic[kTMResourceType] intValue]);
    TMResource* res = nil;
    switch (type) {
        case TMResourceImage:
            res = [TMResText new];
            break;
        case TMResourceText:
            res = [TMResText new];
            break;
        default:
            res = [TMResUnknow new];
            break;
    }
    [res setValuesForKeysWithDictionary:dic];
    return res;
}

@end
