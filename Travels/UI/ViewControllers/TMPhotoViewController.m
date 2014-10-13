//
//  TMPhotoViewController.m
//  Travels
//
//  Created by stonedong on 14-9-26.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "TMPhotoViewController.h"
#import "DZPhotoLibrary.h"
#import "DZProgramDefines.h"
#import "TMPhotoViewCell.h"
#import "TMPhotoCollectionView.h"
static NSString* kColletionView = @"kCollectionView";

@interface TMPhotoViewController () <TMPhotoCollectionViewDelegate>
DEFINE_PROPERTY_STRONG(NSMutableArray*, allMetaDatas);
@end

@implementation TMPhotoViewController
- (void) loadView
{
    UICollectionViewFlowLayout* flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.itemSize = CGSizeMake(100, 100);
    TMPhotoCollectionView* collectionView = [[TMPhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:flowLayout];
    collectionView.photoDelegate = self;
    self.collectionView = collectionView;
    self.view = self.collectionView;
    self.collectionView.scrollEnabled = YES;
    
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[TMPhotoViewCell class] forCellWithReuseIdentifier:kColletionView];
    [self.collectionView reloadData];
    self.view.backgroundColor = [UIColor whiteColor];

    self.allMetaDatas =  [[DZPhotoShareLibrary allImages] mutableCopy];
}

#pragma mark --
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.allMetaDatas.count;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kColletionView forIndexPath:indexPath];

    if (DZ_CheckObjcetClass(cell, TMPhotoViewCell)) {
        TMPhotoViewCell* tmCell  = (TMPhotoViewCell*)cell;
        PHAsset* asset = [self.allMetaDatas objectAtIndex:indexPath.row];
        
        PHImageRequestOptions* option = [[PHImageRequestOptions alloc] init];
        option.synchronous = NO;
        option.resizeMode = PHImageRequestOptionsResizeModeFast;
        
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeAspectFill options:option resultHandler:^(UIImage *result, NSDictionary *info) {
            tmCell.imageView.image = result;

        }];
    }
    return cell;
}

- (void) colletionView:(TMPhotoCollectionView *)collectionView didGetLongPressAtCell:(UICollectionViewCell *)cell indexPath:(NSIndexPath *)indexPath
{

}
@end
