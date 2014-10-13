//
//  TMTransableTestView.h
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMTransformProtocol.h"
#import "DZProgramDefines.h"
@interface TMTransableTestView : UIView <TMTransformProtocol>
DEFINE_PROPERTY_STRONG_UIImageView(imageView);
@end
