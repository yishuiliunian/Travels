//
//  TMTransableTestView.m
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMTransableTestView.h"
#import "DZProgramDefines.h"
@implementation TMTransableTestView
- (void) commonInit
{
    INIT_SELF_SUBVIEW_UIImageView(_imageView);
}
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    [self commonInit];
    return self;
}

- (UIView*) itemViewForTransformView:(TMTransformView *)transformView
{
    return _imageView;
}

- (id) itemContentForTransformView:(TMTransformView *)transformView
{
    return @"我是需要被传递的信息";
}

- (void) layoutSubviews
{
    _imageView.frame = CGRectMake(40, 40, 40, 40);
}
@end
