//
//  NSObject+BLCMedia.h
//  Blocstagram
//
//  Created by RH Blanchfield on 3/10/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@class BLCUser;

@interface BLCMedia : NSObject <NSCoding>

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) BLCUser *user;
@property (nonatomic, strong) NSURL *mediaURL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSArray *comments;

- (instancetype) initWithDictionary:(NSDictionary *)mediaDictionary;

@end
