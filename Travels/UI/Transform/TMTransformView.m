//
//  TMTransformView.m
//  Travels
//
//  Created by stonedong on 14-10-12.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMTransformView.h"
#import "UIView+Transable.h"
#import "TMTransformProtocol.h"
#import "TMTransformItemView.h"
#import "TMTransformRecivableProtocol.h"
@interface TMTransformView ()
{
    UILongPressGestureRecognizer* _longPressRecg;
    TMTransformItemView* _currentTransformItemView;
}
@end

@implementation TMTransformView

- (void) commonInit
{
    _longPressRecg = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressRecg:)];
    [self  addGestureRecognizer:_longPressRecg];
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
- (void) handleLongPressRecg:(UILongPressGestureRecognizer*)longPressRecg
{
    if (_longPressRecg != longPressRecg) {
        return;
    }
    
    switch (longPressRecg.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint point = [longPressRecg locationInView:self];
            
            NSArray* transableViews = [self transableSubviewAtPoint:point];
            
            UIView<TMTransformProtocol>* transableView = [transableViews firstObject];
            
            UIView* moveingView = [transableView itemViewForTransformView:self];
            id content = [transableView itemContentForTransformView:self];
            
            _currentTransformItemView = [TMTransformItemView new];
            _currentTransformItemView.originView = moveingView;
            _currentTransformItemView.content = content;
            
            _currentTransformItemView.backgroundColor = [UIColor redColor];
            _currentTransformItemView.frame = [transableView convertRect:moveingView.frame toView:self];
            [self addSubview:_currentTransformItemView];
            [self bringSubviewToFront:_currentTransformItemView];
            
        }
            break;
        
        case UIGestureRecognizerStateChanged:{
            if (!_currentTransformItemView) {
                return;
            }
            
            CGPoint point = [longPressRecg locationInView:self];
    
            _currentTransformItemView.center = point;
            
            NSArray* reviableViews = [self recivableSubviewsAtPoint:point];
            if (reviableViews.count) {
                UIView<TMTransformRecivableProtocol>* reciveView = [reviableViews firstObject];
                [reciveView transformView:self movingItem:_currentTransformItemView atPoint:point];
            }
        }
            
            break;
            
        case UIGestureRecognizerStateEnded: {
            if (!_currentTransformItemView) {
                return;
            }
            
            CGPoint point = [longPressRecg locationInView:self];
            
            _currentTransformItemView.center = point;
            
            NSArray* reviableViews = [self recivableSubviewsAtPoint:point];
            if (reviableViews.count) {
                UIView<TMTransformRecivableProtocol>* reciveView = [reviableViews firstObject];
                [reciveView transformView:self finishMovingItem:_currentTransformItemView atPoint:point];
            }
            [_currentTransformItemView removeFromSuperview];
            _currentTransformItemView = nil;
        }
            break;
        default:
            break;
    }
}


@end
