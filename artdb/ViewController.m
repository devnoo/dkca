//
//  ViewController.m
//  MyWineList
//
//  Created by Mark van der Voort on 19-10-12.
//  Copyright (c) 2012 De Nederlandsche Bank. All rights reserved.
//

#import "ViewController.h"
#import "WinesDAO.h"
#import "WineList.h"

@implementation ViewController

@synthesize wineViewer;
@synthesize wineName;
@synthesize wineRating;
@synthesize wines;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
        WinesDAO * mywines =[[WinesDAO alloc] init];
        self.wines = [mywines getMyWines];
        [self.wineViewer setImage:((WineList *) [self.wines objectAtIndex:0]).photo];
        [self.wineName setText:((WineList *) [self.wines objectAtIndex:0]).wine];
        
        [self.wineRating setText:((WineList *) [self.wines objectAtIndex:0]).rating];
        
        [super viewDidLoad];
    }

- (void)viewDidUnload
{
    {
        [self setWineViewer:nil];
        [self setWineName:nil];
        [self setWineRating:nil];
        [super viewDidUnload];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



- (IBAction)GetWineListing:(id)sender {
    static NSInteger currentIndex = 0;
    if (++currentIndex == [self.wines count]) {
        currentIndex=0;
        
    }
    WineList *aWine = (WineList *) [self.wines objectAtIndex: currentIndex];
    [self.wineName setText:aWine.wine];
    [self.wineRating setText:aWine.rating];
    [self.wineViewer setImage:aWine.photo];
}



@end
