//
//  DKAQueryResultTableViewCell.m
//  de Kunstkijker
//
//  Created by Mark van der Voort on 02-11-12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import "DKAQueryResultTableViewCell.h"

@implementation DKAQueryResultTableViewCell

@synthesize image;
@synthesize artistLabel;
@synthesize titleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
