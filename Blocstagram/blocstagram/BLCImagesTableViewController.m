//
//  BLCImagesTableViewController.m
//  Blocstagram
//
//  Created by RH Blanchfield on 3/9/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import "BLCImagesTableViewController.h"
#import "NSObject+BLCDataSource.h"
#import "NSObject+BLCMedia.h"
#import "NSObject+BLCUser.h"
#import "NSObject+BLCComment.h"
#import "UITableViewCell+BLCMediaTableViewCell.h"

@interface BLCImagesTableViewController () < UIViewControllerTransitioningDelegate>

{
    BLCMediaTableViewCell  *cell;
}

@end

@implementation BLCImagesTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[BLCDataSource sharedInstance] addObserver:self forKeyPath:@"mediaItems" options:0 context:nil];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshControlDidFire:) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView registerClass:[BLCMediaTableViewCell class] forCellReuseIdentifier:@"mediaCell"];
}
- (void) refreshControlDidFire:(UIRefreshControl *) sender {
    [[BLCDataSource sharedInstance] requestNewItemsWithCompletionHandler:^(NSError *error) {
        [sender endRefreshing];
    }];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self) {
        self.images = [NSMutableArray array];
    }
    
    return self;
}

- (void) infiniteScrollIfNecessary {
    NSIndexPath *bottomIndexPath = [[self.tableView indexPathsForVisibleRows] lastObject];
    
    if (bottomIndexPath && bottomIndexPath.row == [BLCDataSource sharedInstance].mediaItems.count - 1) {
        // The very last cell is on screen
        [[BLCDataSource sharedInstance] requestOldItemsWithCompletionHandler:nil];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self infiniteScrollIfNecessary];
}

#pragma mark - Table view data source


- (CGFloat) tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BLCMedia *item = [BLCDataSource sharedInstance].mediaItems[indexPath.row];
    //UIImage *image = self.images[indexPath.row];
    //return (CGRectGetWidth(self.view.frame) / image.size.width) * image.size.height;
    //return 300 + (image.size.height / image.size.width * CGRectGetWidth(self.view.frame));
    
    
    return [BLCMediaTableViewCell heightForMediaItem:item width:CGRectGetWidth(self.view.frame)];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
//    return self.images.count;
    NSInteger nCount = [[BLCDataSource sharedInstance] countOfMediaItems];
    return nCount;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
    
    // Configure the cell...
    //static NSInteger imageViewTag = 1234;
    //UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:imageViewTag];
    
    //if (!imageView) {
        // This is a new cell, it doesn't have an image view yet
        //imageView = [[UIImageView alloc] init];
        //imageView.contentMode = UIViewContentModeScaleToFill;
        
        //imageView.frame = cell.contentView.bounds;
        //imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        //imageView.tag = imageViewTag;
        //[cell.contentView addSubview:imageView];
    //}
    
    //UIImage *image = self.images[indexPath.row];
    //imageView.image = image;
    cell = [tableView dequeueReusableCellWithIdentifier:@"mediaCell" forIndexPath:indexPath];
    cell.mediaItem = [BLCDataSource sharedInstance].mediaItems[indexPath.row];
    return cell;
    
    
}


// Override to support conditional editing of the table view.



// During startup (-viewDidLoad or in storyboard) do:



// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
//        [self.images removeObjectAtIndex:[indexPath row]];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [[BLCDataSource sharedInstance] removeObjectFromMediaItemsAtIndex:indexPath.row];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void) dealloc
{
    [[BLCDataSource sharedInstance] removeObserver:self forKeyPath:@"mediaItems"];
}
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == [BLCDataSource sharedInstance] && [keyPath isEqualToString:@"mediaItems"]) {
        // We know mediaItems changed.  Let's see what kind of change it is.
        int kindOfChange = [change[NSKeyValueChangeKindKey] intValue];
        
        if (kindOfChange == NSKeyValueChangeSetting) {
            // Someone set a brand new images array
            [self.tableView reloadData];
    
    } else if (kindOfChange == NSKeyValueChangeInsertion ||
               kindOfChange == NSKeyValueChangeRemoval ||
               kindOfChange == NSKeyValueChangeReplacement) {
        // We have an incremental change: inserted, deleted, or replaced images
        
        // Get a list of the index (or indices) that changed
        NSIndexSet *indexSetOfChanges = change[NSKeyValueChangeIndexesKey];
        
        // Convert this NSIndexSet to an NSArray of NSIndexPaths (which is what the table view animation methods require)
        NSMutableArray *indexPathsThatChanged = [NSMutableArray array];
        [indexSetOfChanges enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:idx inSection:0];
            [indexPathsThatChanged addObject:newIndexPath];
        }];
        
        // Call `beginUpdates` to tell the table view we're about to make changes
        [self.tableView beginUpdates];
        
        // Tell the table view what the changes are
        if (kindOfChange == NSKeyValueChangeInsertion) {
            [self.tableView insertRowsAtIndexPaths:indexPathsThatChanged withRowAnimation:UITableViewRowAnimationAutomatic];
        } else if (kindOfChange == NSKeyValueChangeRemoval) {
            [self.tableView deleteRowsAtIndexPaths:indexPathsThatChanged withRowAnimation:UITableViewRowAnimationAutomatic];
        } else if (kindOfChange == NSKeyValueChangeReplacement) {
            [self.tableView reloadRowsAtIndexPaths:indexPathsThatChanged withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        // Tell the table view that we're done telling it about changes, and to complete the animation
        [self.tableView endUpdates];
    }
  }
}

@end