//
//  TMDataParser.h
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TMTravel;
@interface TMDataParser : NSObject
- (TMTravel*) paraseWithData:(NSData*)data error:(NSError* __autoreleasing*)error;
@end
