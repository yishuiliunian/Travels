//
//  TMEditViewController.m
//  Travels
//
//  Created by stonedong on 14-10-10.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMEditViewController.h"
#import "TMPhotoViewController.h"
@implementation TMEditViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
    
    TMPhotoViewController* photoViewController = [TMPhotoViewController new];
    
    [photoViewController willMoveToParentViewController:self];
    [self addChildViewController:photoViewController];
    [self.view addSubview:photoViewController.view];
    photoViewController.view.frame = CGRectMake(0, 200, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 200);
    [photoViewController didMoveToParentViewController:self];
}
@end
