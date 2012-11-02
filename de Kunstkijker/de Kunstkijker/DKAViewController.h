//
//  DKAViewController.h
//  de Kunstkijker
//
//  Created by Job de Noo on 11/1/12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKAViewController : UIViewController{
    NSMutableArray *artWorks;
}
@property (nonatomic, retain) NSMutableArray *artWorks;
@property (nonatomic, weak) IBOutlet UIImageView *photoView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *objectNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (nonatomic) NSString *objectNumber;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containedView;

- (IBAction)getNext:(id)sender;
- (IBAction)getPrevious:(id)sender;

- (IBAction)dismiss:(id)sender;



@end
