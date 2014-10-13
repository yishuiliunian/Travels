//
//  TMTransformViewController.m
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMTransformViewController.h"
#import "TMTransableTestView.h"
#import "TMRecivableView.h"


@implementation TMTransformViewController
@synthesize transformView = _transformView;

- (void) loadView
{
    _transformView = [[TMTransformView alloc] initWithFrame:CGRectLoadViewFrame];
    self.view = _transformView;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    TMTransableTestView* testView = [TMTransableTestView new];
    [self.view addSubview:testView];
    testView.frame = CGRectMake(0, 200, 300, 200);
    testView.backgroundColor = [UIColor blueColor];
    
    
    TMRecivableView* recivableView = [TMRecivableView new];
    [self.view addSubview:recivableView];
    recivableView.frame = CGRectMake(0, 0, 300, 150);
    recivableView.backgroundColor = [UIColor grayColor];
}

@end
