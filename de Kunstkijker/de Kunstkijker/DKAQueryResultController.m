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
@property (nonatomic, retain) NSMutableArray *searchResults;

@end

@implementation DKAQueryResultController
@synthesize artWorks;
@synthesize searchResults;




- (void)viewDidLoad
{
        self.artWorks = [DKAArtWorkDao getMyArtworks];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    
    if ([tableView
         isEqual:self.searchDisplayController.searchResultsTableView]){
        rows = [self.searchResults count];
    }
    else{
        rows = [self.artWorks count];
    }
    
    return rows;
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
    
    DKAArtWork *artwork;
         
    if ([tableView isEqual:self.searchDisplayController.searchResultsTableView]){
        artwork = [searchResults objectAtIndex:indexPath.row];
    }
    else{
        artwork= [self.artWorks objectAtIndex:indexPath.row];
    }
        
        
    
    // Configure the cell...
  
    cell.imageView.image = artwork.photo;
    cell.textLabel.text = artwork.title;
    cell.detailTextLabel.text = artwork.artist;
   
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"in prepare segue");
    if([@"presentDetail" isEqualToString:segue.identifier]) {
        NSIndexPath *index = [self.tableView indexPathForCell:sender];
        DKAArtWork *artwork = [self.artWorks objectAtIndex:index.row];
        [[segue destinationViewController] setObjectNumber:artwork.objectNumber];
    }
}


- (void)filterContentForSearchText:(NSString*)searchText
                             scope:(NSString*)scope
{
    self.searchResults = [[NSMutableArray alloc] initWithArray:[artWorks subarrayWithRange:NSMakeRange(1,3)]];
}



- (void)viewDidUnload {
    [self setSearchBar:nil];
    [self setSearchController:nil];
    [super viewDidUnload];
}
#pragma mark - UISearchDisplayController delegate methods
 -(BOOL)searchDisplayController:(UISearchDisplayController *)controller
            shouldReloadTableForSearchString:(NSString *)searchString
    {
        [self filterContentForSearchText:searchString
                                   scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                          objectAtIndex:[self.searchDisplayController.searchBar
                                                         selectedScopeButtonIndex]]];
        
        return YES;
    }
                                                               
 - (BOOL)searchDisplayController:(UISearchDisplayController *)controller
            shouldReloadTableForSearchScope:(NSInteger)searchOption
    {
        [self filterContentForSearchText:[self.searchDisplayController.searchBar text] 
                                   scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                          objectAtIndex:searchOption]];
        
        return YES;
    }
                                                               
@end