//
//  DKAViewController.m
//  de Kunstkijker
//
//  Created by Job de Noo on 11/1/12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import "DKAViewController.h"
#import "DKAArtWorkDao.h" 
#import "DKAArtWork.h"

@interface DKAViewController ()

@end
@implementation DKAViewController

@synthesize objectNumberLabel;
@synthesize artWorks;
@synthesize photoView;
@synthesize titleLabel;
@synthesize artistLabel;
@synthesize descriptionTextView;


- (void)viewDidLoad
{
    DKAArtWorkDao * dao =[[DKAArtWorkDao alloc] init];
    self.artWorks = [dao getMyArtworks];
    DKAArtWork *artWork = (DKAArtWork*) [self.artWorks objectAtIndex:0];
    
    [self.objectNumberLabel setText:(artWork.objectNumber)];
    [self.titleLabel setText:(artWork.title)];
    [self.artistLabel setText:(artWork.artist)];
    
    [self.descriptionTextView setText:(artWork.description)];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getNext:(id)sender{
    
}
-(IBAction)getPrevious:(id)sender{
    
}
- (void)viewDidUnload {
    [self setDescriptionTextView:nil];
    [super viewDidUnload];
}
@end
