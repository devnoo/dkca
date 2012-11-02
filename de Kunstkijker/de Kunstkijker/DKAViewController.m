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
@property (nonatomic) int currentItem;


@end
@implementation DKAViewController

@synthesize objectNumberLabel;
@synthesize artWorks;
@synthesize photoView;
@synthesize titleLabel;
@synthesize artistLabel;
@synthesize descriptionTextView;
@synthesize objectNumber;



- (void)viewDidLoad
{
    
    //DKAArtWorkDao * dao =[[DKAArtWorkDao alloc] init];
    self.artWorks = [DKAArtWorkDao getMyArtworks];
    
    if (self.objectNumber){
        for (DKAArtWork *artWork in self.artWorks){
            if ([artWork.objectNumber isEqualToString: self.objectNumber]){
                self.currentItem = [self.artWorks indexOfObject:artWork];
                break;               
            }
        }
        
    }
   
    DKAArtWork *artWork = (DKAArtWork*) [self.artWorks objectAtIndex:self.currentItem];
    
    
    [self presentArtWork:artWork];
    
    [self.descriptionTextView setText:(artWork.description)];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentArtWork:(DKAArtWork *)artWork {
    [self.objectNumberLabel setText:(artWork.objectNumber)];
    [self.titleLabel setText:(artWork.title)];
    [self.artistLabel setText:(artWork.artist)];
    [self.photoView setImage:artWork.photo];
    
    [self.descriptionTextView setText:(artWork.description)];
}

- (IBAction)getNext:(id)sender{
    self.currentItem --;
    if (self.currentItem < 0){
        self.currentItem = artWorks.count -1;
    }
    DKAArtWork *artWork = (DKAArtWork*) [self.artWorks objectAtIndex:self.currentItem];
    
    [self presentArtWork:artWork];
    
}
-(IBAction)getPrevious:(id)sender{
    NSLog(@" in get previous");
    self.currentItem ++;
    if (self.currentItem == artWorks.count){
        self.currentItem = 0;
    }
    DKAArtWork *artWork = (DKAArtWork*) [self.artWorks objectAtIndex:self.currentItem];
    
    [self presentArtWork:artWork];

    
}
- (void)viewDidUnload {
    [self setDescriptionTextView:nil];
    [super viewDidUnload];
}
@end
