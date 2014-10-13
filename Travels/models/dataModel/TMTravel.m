//
//  TMTravel.m
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMTravel.h"
#import "TMUser.h"
#import "TMSegement.h"

INIT_DZ_EXTERN_STRING(kTMTravelName, name);
INIT_DZ_EXTERN_STRING(kTMTravelLocationName, locationName);
INIT_DZ_EXTERN_STRING(kTMTravelAuthor, author);
INIT_DZ_EXTERN_STRING(kTMTravelSegements, segements);

@implementation TMTravel
- (void) setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:kTMTravelName]) {
        [self setName:value];
    } else if ([key isEqualToString:kTMTravelAuthor]) {
        if (DZ_CheckObjcetClass(value, NSDictionary)) {
            TMUser* user = [TMUser userWithDictionary:value];
            [self setAuthor:user];

        } else {
            [self setAuthor:[TMUser unknowUser]];
        }
        
    } else if ([key isEqualToString:kTMTravelLocationName]) {
        [self setLocationName:value];
    } else if ([key isEqualToString:kTMTravelSegements]) {
        if (DZ_CheckObjcetClass(value, NSArray)){
            
            NSMutableArray* segements = [NSMutableArray new];
            for (NSDictionary* dic in value) {
                if (!DZ_CheckObjcetClass(dic, NSDictionary)) {
                    continue;
                }
                
                TMSegement* segment = [TMSegement segementWithDictionary:dic];
                [segements addObject:segment];
            }
            
            [self setSegements:segements];
            
        } else {
            [self setSegements:@[]];
        }
    }
}
@end
