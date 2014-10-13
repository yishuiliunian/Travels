//
//  TMTransformViewController.h
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZProgramDefines.h"
#import "TMTransformView.h"
#import "DZDevices.h"
@interface TMTransformViewController : UIViewController
DEFINE_PROPERTY_STRONG_READONLY(TMTransformView*, transformView);
@end
