//
//  DKAQueryResultTableViewCell.h
//  de Kunstkijker
//
//  Created by Mark van der Voort on 02-11-12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKAQueryResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
