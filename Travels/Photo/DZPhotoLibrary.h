//
//  DZPhotoLibrary.h
//  Travels
//
//  Created by stonedong on 14-10-10.
//  Copyright (c) 2014年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#define DZPhotoShareLibrary [DZPhotoLibrary shareLibrary]

@interface DZPhotoLibrary : NSObject
@property (nonatomic, strong, readonly) PHPhotoLibrary* library;
+ (DZPhotoLibrary*) shareLibrary;
//
- (NSArray*) allImages;
@end
