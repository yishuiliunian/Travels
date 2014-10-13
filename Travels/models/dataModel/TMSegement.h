//
//  TMSegement.h
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMModelBase.h"

DEFINE_DZ_EXTERN_STRING(kTMSegementCreateDate);
DEFINE_DZ_EXTERN_STRING(kTMSegementResources);

@interface TMSegement : TMModelBase
DEFINE_PROPERTY_STRONG_NSDate(createDate);
DEFINE_PROPERTY_STRONG_NSArray(resources);

+ (TMSegement*) segementWithDictionary:(NSDictionary*)dic;

@end
