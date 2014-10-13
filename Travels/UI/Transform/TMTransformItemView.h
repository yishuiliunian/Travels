//
//  TMTransformItemView.h
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZProgramDefines.h"
@interface TMTransformItemView : UIView
DEFINE_PROPERTY_STRONG(id, content);
DEFINE_PROPERTY_STRONG(UIView*, originView);
DEFINE_PROPERTY_STRONG_UIImageView(imageView);
@end
