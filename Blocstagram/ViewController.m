//
//  ViewController.m
//  Blocstagram
//
//  Created by RH Blanchfield on 3/9/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import "ViewController.h"

@implementation UITableView (BLCImagesTableViewController)

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i = 1; i <= 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            [self.images addObject:image];
        }
    }
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"imageCell"];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.images.count;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.images = [NSMutableArray array];
        
    }
    return self;
}
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];

// Configure the cell...
static NSInteger imageViewTag = 1234;
UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:imageViewTag];

if (!imageView) {
    // This is a new cell, it doesn't have an image view yet
    imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    imageView.frame = cell.contentView.bounds;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    imageView.tag = imageViewTag;
    [cell.contentView addSubview:imageView];
}

UIImage *image = self.images[indexPath.row];
imageView.image = image;

@end