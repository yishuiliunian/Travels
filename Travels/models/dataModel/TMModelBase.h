//
//  TMModelBase.h
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZProgramDefines.h"

DEFINE_DZ_EXTERN_STRING(kTMModelGuid);
@interface TMModelBase : NSObject
DEFINE_PROPERTY_STRONG_NSString(guid);
@end
