//
//  TMTransformRecivableProtocol.h
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMTransformView;
@class TMTransformItemView;
@protocol TMTransformRecivableProtocol <NSObject>

- (void) transformView:(TMTransformView*)transformView  movingItem:(TMTransformItemView*)itemView atPoint:(CGPoint)point;

- (void) transformView:(TMTransformView*)transformView  finishMovingItem:(TMTransformItemView*)itemView atPoint:(CGPoint)point;
@end
