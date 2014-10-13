//
//  TMRecivableView.m
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMRecivableView.h"
#import "TMTransformItemView.h"

@implementation TMRecivableView

- (void) transformView:(TMTransformView *)transformView movingItem:(TMTransformItemView *)itemView atPoint:(CGPoint)point
{
    
}

- (void) transformView:(TMTransformView *)transformView finishMovingItem:(TMTransformItemView *)itemView atPoint:(CGPoint)point
{
    UILabel* label = [UILabel new];
    label.text = itemView.content;
    
    [self addSubview:label];
    CGRect rect = itemView.frame;
    rect.origin = point;
    label.frame = rect;
}

@end
