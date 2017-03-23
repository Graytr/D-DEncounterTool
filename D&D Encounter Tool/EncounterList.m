//
//  EncounterList.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "EncounterList.h"
#import "PreferenceHelper.h"

@implementation EncounterList


+(NSArray*) getEncounters {
    NSArray* result;
    NSString *pathToEncounters = [PreferenceHelper fullPathToPreferenceFileInDocumentsDirectory:@"encounters.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:pathToEncounters]) {
        NSLog(@"encounters.plist NOT found, creating default");
        NSString *defaultFilePath = [[NSBundle mainBundle] pathForResource:@"encounters" ofType:@"plist"];
        
        result = [NSArray arrayWithContentsOfFile:defaultFilePath];
        [EncounterList saveEncountersWithArrayOfEncounters:result];
    } else {
        NSLog(@"encounters.plist found");
        result = [NSArray arrayWithContentsOfFile:pathToEncounters];
    }
    
    NSLog(@"%@", pathToEncounters);
    return result;
}

+ (BOOL)saveEncountersWithArrayOfEncounters:(NSArray *)encounters {
    NSString *pathToEncounters = [PreferenceHelper fullPathToPreferenceFileInDocumentsDirectory:@"encounters.plist"];
    return [encounters writeToFile:pathToEncounters atomically:YES];
}



@end
