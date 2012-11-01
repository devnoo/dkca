//
//  DKAArtWorkDao.h
//  de Kunstkijker
//
//  Created by Job de Noo on 11/1/12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DKAArtWorkDao : NSObject{

    sqlite3 *db;
    
}
- (NSMutableArray * ) getMyArtworks;

@end
