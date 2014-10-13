//
//  UIView+Transable.h
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMTransformView;
@interface UIView (Transable)
@property (nonatomic, strong, readonly) TMTransformView* superTransformView;

- (NSArray*) transableSubviewAtPoint:(CGPoint)point;
- (NSArray*) recivableSubviewsAtPoint:(CGPoint)point;
@end
