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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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



@end
