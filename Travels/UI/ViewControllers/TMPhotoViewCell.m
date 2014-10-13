//
//  TMPhotoViewCell.m
//  Travels
//
//  Created by stonedong on 14-10-10.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMPhotoViewCell.h"

@implementation TMPhotoViewCell
- (void) commonInit
{
    INIT_SUBVIEW_UIImageView(self.contentView, _imageView);
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
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

- (void) layoutSubviews
{
    _imageView.frame = self.bounds;
}
@end
