//
//  TMPhotoCollectionView.h
//  Travels
//
//  Created by stonedong on 14-10-10.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMPhotoCollectionView;
@protocol TMPhotoCollectionViewDelegate
- (void) colletionView:(TMPhotoCollectionView*)collectionView didGetLongPressAtCell:(UICollectionViewCell*)cell indexPath:(NSIndexPath*)indexPath;
@end

@interface TMPhotoCollectionView : UICollectionView
@property (nonatomic, weak) NSObject<TMPhotoCollectionViewDelegate>* photoDelegate;
@end
