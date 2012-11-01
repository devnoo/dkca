//
//  DKAArtWorkDao.m
//  de Kunstkijker
//
//  Created by Job de Noo on 11/1/12.
//  Copyright (c) 2012 DNB innovation day team. All rights reserved.
//

#import "DKAArtWorkDao.h"
#import "DKAArtWork.h"
@implementation DKAArtWorkDao
-(NSMutableArray *) getMyArtworks{
    NSMutableArray *artworkArray = [[NSMutableArray alloc] init];
    @try {
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"ArtDB.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        if(!success){
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        else {
            NSLog(@"DB loaded from '%@'.", dbPath);
            
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)){
            NSLog(@"An error has occurred");
        }
        if(!db){
            NSLog(@"ERROR: Database has not been set");
        }
        //        const char *sql = "SELECT id, Wine, Rating, Photo FROM WineTbl";
        const char *sql = "SELECT objectnummer, titel, vervaardiger, objectnaam, techniek, startdatum, einddatum, hoogte, breedte, diepte, parent, beschrijving thumb FROM artworks";
        sqlite3_stmt *sqlStatement;
        int returnCode = sqlite3_prepare(db, sql, -1, &sqlStatement, NULL);
        if (returnCode != SQLITE_OK){
            NSLog(@"ERROR: Problem with prepare statement, returncode: %d", returnCode);
        }
        //
        while (sqlite3_step(sqlStatement) == SQLITE_ROW){
            DKAArtWork* artwork = [[DKAArtWork alloc] init];
            artwork.objectNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,0)];
            artwork.title = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
            artwork.artist = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,2)];
           
            const char *raw = sqlite3_column_blob(sqlStatement, 3);
            int rawLen = sqlite3_column_bytes(sqlStatement,3);
            NSData *data = [NSData dataWithBytes:raw length: rawLen];
            artwork.photo = [[UIImage alloc] initWithData:data];
            [artworkArray addObject:artwork];
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occurred: %@", [exception reason]);
    }
    @finally {
        return artworkArray;
    }
}

-(DKAArtWork *) getById: (NSString*) id{
    DKAArtWork* artwork = [[DKAArtWork alloc] init];
    @try {
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"ArtDB.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        if(!success){
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        else {
            NSLog(@"DB loaded from '%@'.", dbPath);
            
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)){
            NSLog(@"An error has occurred");
        }
        if(!db){
            NSLog(@"ERROR: Database has not been set");
        }
        //        const char *sql = "SELECT id, Wine, Rating, Photo FROM WineTbl";
        const char *sql = "SELECT objectnummer, titel, vervaardiger, objectnaam, techniek, startdatum, einddatum, hoogte, breedte, diepte, parent, beschrijving thumb FROM artworks";
        sqlite3_stmt *sqlStatement;
        int returnCode = sqlite3_prepare(db, sql, -1, &sqlStatement, NULL);
        if (returnCode != SQLITE_OK){
            NSLog(@"ERROR: Problem with prepare statement, returncode: %d", returnCode);
        }
        //
      
        if (sqlite3_step(sqlStatement) == SQLITE_ROW){
            
            artwork.objectNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,0)];
            artwork.title = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
            artwork.artist = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,2)];
            
            const char *raw = sqlite3_column_blob(sqlStatement, 3);
            int rawLen = sqlite3_column_bytes(sqlStatement,3);
            NSData *data = [NSData dataWithBytes:raw length: rawLen];
            artwork.photo = [[UIImage alloc] initWithData:data];
            
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occurred: %@", [exception reason]);
    }
    @finally {
        return artwork;;
    }
}

@end
