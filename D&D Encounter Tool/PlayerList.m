//
//  PlayerList.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-21.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "PlayerList.h"
#import "PreferenceHelper.h"

@implementation PlayerList

+(NSArray*) getPlayers {
    NSArray* result;
    NSString *pathToPlayers = [PreferenceHelper fullPathToPreferenceFileInDocumentsDirectory:@"players.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath:pathToPlayers]) {
        NSLog(@"players.plist NOT found, creating default");
        NSString *defaultFilePath = [[NSBundle mainBundle] pathForResource:@"players" ofType:@"plist"];
        
        //result = [NSMutableDictionary dictionaryWithContentsOfFile:defaultFilePath];
        result = [NSArray arrayWithContentsOfFile:defaultFilePath];
        [PlayerList savePlayersWithArrayOfPlayers:result];
    } else {
        NSLog(@"players.plist found");
        result = [NSArray arrayWithContentsOfFile:pathToPlayers];
    }
    
    NSLog(@"%@", pathToPlayers);
    return result;
}

+ (BOOL)savePlayersWithArrayOfPlayers:(NSArray *)players {
    NSString *pathToPlayers = [PreferenceHelper fullPathToPreferenceFileInDocumentsDirectory:@"players.plist"];
    return [players writeToFile:pathToPlayers atomically:YES];
}

@end
