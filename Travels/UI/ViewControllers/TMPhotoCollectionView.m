//
//  TMPhotoCollectionView.m
//  Travels
//
//  Created by stonedong on 14-10-10.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMPhotoCollectionView.h"

@interface TMPhotoCollectionView ()
{
    UILongPressGestureRecognizer* _longPressRecoginizer;
    UICollectionViewCell* _movingCell;
}
@end

@implementation TMPhotoCollectionView
- (void) commonInit {
    
    _longPressRecoginizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self addGestureRecognizer:_longPressRecoginizer];
}

- (instancetype) initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (!self) {
        return self;
    }
    [self commonInit];
    return self;
}
- (void) handleLongPress:(UILongPressGestureRecognizer*)longPress
{
    if (longPress != _longPressRecoginizer) {
        return;
    }
    
    static CGPoint startPoint;
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint point = [longPress locationInView:self];
            NSArray* visibleCells = self.visibleCells;
            
            for (UICollectionViewCell* cell  in visibleCells) {
                if (CGRectContainsPoint(cell.frame, point)) {
                    if ([self.photoDelegate respondsToSelector:@selector(colletionView:didGetLongPressAtCell:indexPath:)]) {
                        startPoint = cell.center;
                        _movingCell = cell;
                        self.scrollEnabled = NO;
                        
                        [self.window addSubview:_movingCell];
                        [self.window bringSubviewToFront:_movingCell];

                        CGRect rect = cell.frame;
                
                        rect.origin = [longPress locationInView:self.window];
                        rect.origin.x -= 10;
                        rect.origin.y -= 10;
                        rect.size.width += 20;
                        rect.size.height += 20;
                        cell.frame = rect;
                    }
                }
            }
        }
            break;
        case UIGestureRecognizerStateChanged: {
            CGPoint point = [longPress locationInView:self.window];
            if (_movingCell) {

                _movingCell.center = point;
            }
        }
            break;
            
        case UIGestureRecognizerStateRecognized:
        {
            [self addSubview:_movingCell];
            self.scrollEnabled = YES;
            [UIView animateWithDuration:0.25 animations:^{
                _movingCell.center = startPoint;
            }];
            startPoint = CGPointZero;
            _movingCell = nil;
        }
        default:
            break;
    }
    
    

}
@end
