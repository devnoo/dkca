//
//  WinesDAO.h
//  MyWineList
//
//  Created by Mark van der Voort on 19-10-12.
//  Copyright (c) 2012 De Nederlandsche Bank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface WinesDAO : NSObject {
    sqlite3 *db;
}

- (NSMutableArray *) getMyWines;



@end
