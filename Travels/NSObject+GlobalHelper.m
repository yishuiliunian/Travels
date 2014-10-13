//
//  NSObject+GlobalHelper.m
//  Travels
//
//  Created by stonedong on 14-9-25.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "NSObject+GlobalHelper.h"
#import "DZProgramDefines.h"
#import <NSDate+SAMAdditions.h>
@implementation NSObject (GlobalHelper)
- (NSDate*) dateValue
{
    if (DZ_CheckObjcetClass(self, NSDate)) {
        return (NSDate*)self;
    } else if (DZ_CheckObjcetClass(self, NSString)) {
        NSDate* date = [NSDate sam_dateFromISO8601String:(NSString*)self];
        return date;
    }
    return nil;
}
@end
