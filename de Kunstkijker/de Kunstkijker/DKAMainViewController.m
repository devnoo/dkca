//
//  DKAMainViewController.m
//  de Kunstkijker
//
//  Created by Mark van der Voort on 01-11-12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import "DKAMainViewController.h"
#import "DKAViewController.h"

@interface DKAMainViewController ()

@end

@implementation DKAMainViewController

@synthesize objectNumber;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"DETAIL_VIEW"])
    {
        // Get reference to the destination view controller
        DKAViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        vc.objectNumber = self.objectNumber;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
    [super viewWillDisappear:animated];
}



@end
