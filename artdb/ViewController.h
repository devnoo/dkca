//
//  ViewController.h
//  MyWineList
//
//  Created by Mark van der Voort on 19-10-12.
//  Copyright (c) 2012 De Nederlandsche Bank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray *wines;
}
@property (nonatomic, retain) NSMutableArray *wines;
@property (weak, nonatomic) IBOutlet UIImageView *wineViewer;
@property (weak, nonatomic) IBOutlet UILabel *wineName;
@property (weak, nonatomic) IBOutlet UILabel *wineRating;

- (IBAction)GetWineListing:(id)sender;
- (IBAction)GetWineListingBack:(id)sender;
@end
