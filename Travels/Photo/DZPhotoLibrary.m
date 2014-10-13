//
//  DZPhotoLibrary.m
//  Travels
//
//  Created by stonedong on 14-10-10.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import "DZPhotoLibrary.h"
#import "DZSingletonFactory.h"

@interface DZPhotoLibrary () <PHPhotoLibraryChangeObserver>

@end

@implementation DZPhotoLibrary

- (PHPhotoLibrary*) library
{
    return [PHPhotoLibrary sharedPhotoLibrary];
}

+ (DZPhotoLibrary*) shareLibrary
{
    return DZSingleForClass([DZPhotoLibrary class]);
}

- (void) dealloc
{
    [[PHPhotoLibrary sharedPhotoLibrary] unregisterChangeObserver:self];
}

- (void) commonInit
{
    if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized) {
        [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
    } else {
        __weak DZPhotoLibrary *  library = self;
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                DZPhotoLibrary* tempLibrary = library;
                [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:tempLibrary];
            }
        }];
    }
}

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    [self commonInit];
    return self;
}

- (void) photoLibraryDidChange:(PHChange *)changeInstance
{
    
}

//

- (NSArray*) allImages
{
   PHFetchResult* result =  [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:nil];
    
    
    NSMutableArray* array = [NSMutableArray new];
    for (PHAsset* asset  in result) {
        [array addObject:asset];
    }
    
    return array;
}


@end
