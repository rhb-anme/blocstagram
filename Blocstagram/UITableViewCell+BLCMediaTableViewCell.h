//
//  UITableViewCell+BLCMediaTableViewCell.h
//  blocstagram
//
//  Created by RH Blanchfield on 3/12/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCMedia;
@interface BLCMediaTableViewCell : UITableViewCell

@property (nonatomic, strong) BLCMedia*mediaItem;
// Get the media item
- (BLCMedia *)mediaItem;
// Set a new media item
- (void)setMediaItem:(BLCMedia *)mediaItem;

+ (CGFloat) heightForMediaItem:(BLCMedia *)mediaItem width:(CGFloat)width;

@end
