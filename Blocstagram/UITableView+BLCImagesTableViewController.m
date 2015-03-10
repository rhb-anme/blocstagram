//
//  UITableView+BLCImagesTableViewController.m
//  Blocstagram
//
//  Created by RH Blanchfield on 3/9/15.
//  Copyright (c) 2015 bloc. All rights reserved.
//

#import "UITableView+BLCImagesTableViewController.h"

@implementation UITableView (BLCImagesTableViewController)

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i = 1; i <= 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.png", i];
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            [self.images addObject:image];
        }
    }
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"imageCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
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
@end
