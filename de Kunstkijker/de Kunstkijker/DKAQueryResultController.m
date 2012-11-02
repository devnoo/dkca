//
//  DKAQueryResultController.m
//  de Kunstkijker
//
//  Created by Mark van der Voort on 01-11-12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import "DKAQueryResultController.h"
#import "DKAViewController.h"
#import "DKAArtWorkDao.h"

#import "DKAArtWork.h"

@interface DKAQueryResultController ()

@property (nonatomic, retain) NSMutableArray *artWorks;

@end

@implementation DKAQueryResultController
@synthesize artWorks;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
        self.artWorks = [DKAArtWorkDao getMyArtworks];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [artWorks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"queryTableCell";
       UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
   
    // Configure the cell...
    DKAArtWork *artwork = [artWorks objectAtIndex:[indexPath row]];
    cell.imageView.image = artwork.photo;
    cell.textLabel.text = artwork.title;
    cell.detailTextLabel.text = artwork.artist;
   
    return cell;
}



@end
