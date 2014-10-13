//
//  TMTravel.h
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMModelBase.h"

@class TMUser;

DEFINE_DZ_EXTERN_STRING(kTMTravelName);
DEFINE_DZ_EXTERN_STRING(kTMTravelLocationName);
DEFINE_DZ_EXTERN_STRING(kTMTravelAuthor);
DEFINE_DZ_EXTERN_STRING(kTMTravelAuthorName);
DEFINE_DZ_EXTERN_STRING(kTMTravelSegements);

@interface TMTravel : TMModelBase
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_STRONG_NSString(locationName);
DEFINE_PROPERTY_STRONG_NSArray(segements);
DEFINE_PROPERTY_STRONG(TMUser*, author);
@end
