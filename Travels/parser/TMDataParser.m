//
//  TMDataParser.m
//  Travels
//
//  Created by stonedong on 14-9-24.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMDataParser.h"
#import "TMTravel.h"
@implementation TMDataParser


- (TMTravel*) paraseWithData:(NSData*)data error:(NSError* __autoreleasing*)error{
    
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:error];
    if ( error!=NULL && *error) {
        return nil;
    }
    TMTravel* travel = [TMTravel new];
    [travel setValuesForKeysWithDictionary:dic];
    return travel;
}
@end
