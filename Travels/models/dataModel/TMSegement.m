//
//  TMSegement.m
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMSegement.h"
#import <NSDate+SAMAdditions.h>
#import "TMResource.h"

INIT_DZ_EXTERN_STRING(kTMSegementCreateDate, createDate);
INIT_DZ_EXTERN_STRING(kTMSegementResources, resources);

@implementation TMSegement

+ (TMSegement*) segementWithDictionary:(NSDictionary *)dic
{
    TMSegement* seg = [TMSegement new];
    [seg setValuesForKeysWithDictionary:dic];
    return seg;
}

- (void) setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:kTMSegementCreateDate]) {
        if (DZ_CheckObjcetClass(value, NSDate)) {
            [self setCreateDate:value];
        } else if (DZ_CheckObjcetClass(value, NSString)) {
            NSDate* date = [NSDate sam_dateFromISO8601String:value];
            [self setCreateDate:date];
        }
    } else if ([key isEqualToString:kTMSegementResources]) {
        if (DZ_CheckObjcetClass(value, NSArray)) {
            
            NSMutableArray* resources = [NSMutableArray new];
            
            NSArray* resArray = (NSArray*)value;
            for (id dic in resArray) {
                if (!DZ_CheckObjcetClass(dic, NSDictionary)) {
                    continue;
                }
                TMResource* res = [TMResource resourceWithDictionary:dic];
                [resources addObject:res];
            }
            
            [self setResources:resources];
            
        } else {
            [self setResources:@[]];
        }
    }
}
@end
