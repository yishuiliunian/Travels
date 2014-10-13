//
//  UIView+Transable.m
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "UIView+Transable.h"
#import "TMTransformProtocol.h"
#import "TMTransformView.h"
#import "DZProgramDefines.h"
#import "TMTransformRecivableProtocol.h"
@implementation UIView (Transable)

- (TMTransformView*) superTransformView
{
    if (!self.superview) {
        return nil;
    }
    if (DZ_CheckObjcetClass(self.superview, TMTransformView)) {
        return (TMTransformView*)self.superview;
    } else {
        return [self.superview superTransformView];
    }
}

- (NSArray*) transableSubviewAtPoint:(CGPoint)point
{
    NSMutableArray* transableViews = [NSMutableArray new];
    
    NSArray* subViews = [self.subviews copy];
    for (UIView* view  in subViews) {
        if (![view conformsToProtocol:@protocol(TMTransformProtocol) ]) {
            continue;
        }
        if (!CGRectContainsPoint(view.frame, point)) {
            continue;
        }
        
        [transableViews addObject:view];
    }
    return transableViews;
}

- (NSArray*) recivableSubviewsAtPoint:(CGPoint)point
{
    NSMutableArray* transableViews = [NSMutableArray new];
    
    NSArray* subViews = [self.subviews copy];
    for (UIView* view  in subViews) {
        if (![view conformsToProtocol:@protocol(TMTransformRecivableProtocol) ]) {
            continue;
        }
        if (!CGRectContainsPoint(view.frame, point)) {
            continue;
        }
        
        [transableViews addObject:view];
    }
    return transableViews;
}



@end
