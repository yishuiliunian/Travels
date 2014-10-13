//
//  TMTransformProtocol.h
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TMTransformView;
@protocol TMTransformProtocol <NSObject>

- (UIView*) itemViewForTransformView:(TMTransformView*)transformView;
- (id) itemContentForTransformView:(TMTransformView*)transformView;
- (void) transformView:(TMTransformView*)transformView beginAtPoint:(CGPoint)point;
- (void) transformView:(TMTransformView*)transformView endAtPoint:(CGPoint)point;

@end
