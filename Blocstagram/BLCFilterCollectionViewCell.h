//
//  BLCFilterCollectionViewCell.h
//  blocstagram
//
//  Created by RH Blanchfield on 3/25/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLCFilterCollectionViewCell : UICollectionViewCell

- (void) setupCellWithFlowLayout: (UICollectionViewFlowLayout*) flowLayout andThumbnail:(UIImage*) thumbnail andTitle:(NSString*) title;

@end
