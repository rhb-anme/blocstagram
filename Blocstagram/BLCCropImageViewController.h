//
//  BLCMediaFullScreenViewController+BLCCropImageViewController.h
//  blocstagram
//
//  Created by RH Blanchfield on 3/25/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import "BLCMediaFullScreenViewController.h"

@class BLCCropImageViewController;

@protocol BLCCropImageViewControllerDelegate <NSObject>

- (void) cropControllerFinishedWithImage:(UIImage *)croppedImage;

@end

@interface BLCCropImageViewController : BLCMediaFullScreenViewController

- (instancetype) initWithImage:(UIImage *)sourceImage;

@property (nonatomic, weak) NSObject <BLCCropImageViewControllerDelegate> *delegate;

@end