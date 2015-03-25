//
//  UIImage+BLCImageUtilities.h
//  blocstagram
//
//  Created by RH Blanchfield on 3/25/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BLCImageUtilities)

- (UIImage *) imageWithFixedOrientation;
- (UIImage *) imageResizedToMatchAspectRatioOfSize:(CGSize)size;
- (UIImage *) imageCroppedToRect:(CGRect)cropRect;

@end

