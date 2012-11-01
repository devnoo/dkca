//
//  DKAArtWork.h
//  de Kunstkijker
//
//  Created by Job de Noo on 11/1/12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKAArtWork : NSObject{
    NSString *title;
    NSString *artist;
    NSString *objectNumber;
    NSString *description;
    UIImage *photo;
}

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *objectNumber;
@property(nonatomic, retain) NSString *artist;
@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain) UIImage *photo;

@end
