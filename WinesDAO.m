//
//  WinesDAO.m
//  MyWineList
//
//  Created by Mark van der Voort on 19-10-12.
//  Copyright (c) 2012 De Nederlandsche Bank. All rights reserved.
//

#import "WinesDAO.h"
#import "WineList.h"

@implementation WinesDAO

- (NSMutableArray *) getMyWines{
    NSMutableArray *wineArray = [[NSMutableArray alloc] init];
    @try {
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"ArtDB.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        if(!success){
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)){
            NSLog(@"An error has occurred");
        }
        if(!db){
            NSLog(@"ERROR: Database has not been set");
        }
//        const char *sql = "SELECT id, Wine, Rating, Photo FROM WineTbl";
        const char *sql = "SELECT objectnummer, titel, vervaardiger, thumb FROM artworks";
        sqlite3_stmt *sqlStatement;
        int returnCode = sqlite3_prepare(db, sql, -1, &sqlStatement, NULL);
        if (returnCode != SQLITE_OK){
            NSLog(@"ERROR: Problem with prepare statement, returncode: %@", returnCode);
        }
        //
        while (sqlite3_step(sqlStatement) == SQLITE_ROW){
            WineList *artwork = [[WineList alloc] init];
            artwork.wineId = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,0)];
            artwork.wine = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
            artwork.rating = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,2)];
            
            const char *raw = sqlite3_column_blob(sqlStatement, 3);
            int rawLen = sqlite3_column_bytes(sqlStatement,3);
            NSData *data = [NSData dataWithBytes:raw length: rawLen];
            artwork.photo = [[UIImage alloc] initWithData:data];
            [wineArray addObject:artwork];
        }
           
           
           
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occurred: %@", [exception reason]);        
    }
    @finally {
        return wineArray;
    }
}

@end
