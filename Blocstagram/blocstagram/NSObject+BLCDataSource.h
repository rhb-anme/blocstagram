//
//  NSObject+BLCDataSource.h
//  Blocstagram
//
//  Created by RH Blanchfield on 3/10/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLCDataSource : NSObject

+ (instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end
