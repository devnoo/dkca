//
//  WineList.h
//  MyWineList
//
//  Created by Mark van der Voort on 19-10-12.
//  Copyright (c) 2012 De Nederlandsche Bank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WineList : NSObject {
    NSString *wine;
    NSString *wineId;
    NSString *rating;
    UIImage *photo;
}

@property (nonatomic, retain) NSString *wine;
@property (nonatomic, retain) NSString *wineId;
@property (nonatomic, retain) NSString *rating;
@property (nonatomic,retain) UIImage *photo;


@end
