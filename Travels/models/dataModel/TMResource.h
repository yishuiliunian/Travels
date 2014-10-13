//
//  TMResource.h
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMModelBase.h"

typedef enum {
    TMResourceUnkonw = 0,
    TMResourceImage,
    TMResourceText,
    TMResourceVedio,
    TMResourceAudio
}TMResourceType;

DEFINE_DZ_EXTERN_STRING(kTMResourceType);
DEFINE_DZ_EXTERN_STRING(kTMResourceCreateDate);
DEFINE_DZ_EXTERN_STRING(kTMResourceModifiedDate);
DEFINE_DZ_EXTERN_STRING(kTMResourceLocalEdit);
DEFINE_DZ_EXTERN_STRING(kTMResourceContent);


@interface TMResource : TMModelBase
@property (nonatomic, assign, readonly) TMResourceType type;
DEFINE_PROPERTY_STRONG_NSDate(createDate);
DEFINE_PROPERTY_STRONG_NSDate(modifiedDate);
DEFINE_PROPERTY_ASSIGN_BOOL(localEdit);
DEFINE_PROPERTY_STRONG_NSString(content);

+ (TMResource*) resourceWithDictionary:(NSDictionary*)dic;

@end
