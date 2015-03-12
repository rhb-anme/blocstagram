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

@interface ImagesTableViewController () < UIViewControllerTransitioningDelegate>


@end

@implementation ImagesTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    for (int i = 1; i <= 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.png", i];
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            [self.images addObject:image];
            [self.tableView reloadData];
            
            
        }
    }
    [self.tableView registerClass:[BLCMediaTableViewCell class] forCellReuseIdentifier:@"mediaCell"];
    
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
    
    return self.images.count;
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
    
    BLCMediaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mediaCell" forIndexPath:indexPath];
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
        [self.images removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

@end