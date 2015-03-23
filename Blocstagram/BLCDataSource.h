//
//  NSObject+BLCDataSource.h
//  Blocstagram
//
//  Created by RH Blanchfield on 3/10/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BLCMedia;

typedef void (^BLCNewItemCompletionBlock)(NSError *error);

@interface BLCDataSource : NSObject

+(instancetype) sharedInstance;
+(NSString *) instagramClientID;


@property (nonatomic, strong, readonly) NSMutableArray *mediaItems; //only the single instance of BLCDataSource can modify this
@property (nonatomic, strong, readonly) NSString *accessToken;

- (void) deleteMediaItem:(BLCMedia *)item;
- (void) downloadImageForMediaItem:(BLCMedia *)item;


- (void) requestNewItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;

@end