//
//  PreferenceHelper.m
//  iCS
//
//  Created by Chad Jones on 04/06/09.
//  Copyright 2009 CollegeMobile, Inc. All rights reserved.
//

#import "PreferenceHelper.h"

@implementation PreferenceHelper

+ (NSString *)fullPathToDocumentsDirectory {
    NSString *fullPathToReturn;

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

    if (paths != nil) {
        fullPathToReturn = [paths objectAtIndex:0];
    }
    else {
        fullPathToReturn = nil;
    }

    return (fullPathToReturn);
}


+ (NSString *)fullPathToPreferenceFileInDocumentsDirectory:(NSString *)preferenceFile {
    assert(preferenceFile != nil);

    NSString *fullPathToReturn;

    NSString *documentsDirectoryPath = [PreferenceHelper fullPathToDocumentsDirectory];

    if (documentsDirectoryPath != nil) {
        fullPathToReturn = [documentsDirectoryPath stringByAppendingPathComponent:preferenceFile];
    }
    else {
        fullPathToReturn = nil;
    }

    return (fullPathToReturn);
}


// Functions to facilitate the reading and writing of plist files.
+ (BOOL)writeToPropertyListPreferenceFile:(NSString *)preferenceFile dictionaryToWrite:(NSDictionary *)dictionaryToWrite {
    assert(preferenceFile != nil);
    assert(dictionaryToWrite != nil);

    BOOL success;

    //Create a path to the preference file to write to
    NSString *fullPathToDataFile = [PreferenceHelper fullPathToPreferenceFileInDocumentsDirectory:preferenceFile];

    if (fullPathToDataFile != nil) {
        success = [dictionaryToWrite writeToFile:fullPathToDataFile atomically:YES];
    }
    else {
        success = NO;
    }

    return (success);
}


+ (NSDictionary *)readDictionaryFromPropertyListPreferenceFile:(NSString *)preferenceFile {
    NSDictionary *dictionaryToReturn;

    //Create a path to the preference file to read from
    NSString *fullPathToDataFile = [PreferenceHelper fullPathToPreferenceFileInDocumentsDirectory:preferenceFile];

    if (fullPathToDataFile != nil) {
        dictionaryToReturn = [NSDictionary dictionaryWithContentsOfFile:fullPathToDataFile];
    }
    else {
        dictionaryToReturn = nil;
    }

    return (dictionaryToReturn);
}


+ (BOOL)writeToPropertyListPreferenceFile:(NSString *)preferenceFile dataToWrite:(NSData *)dataToWrite {
    assert(preferenceFile != nil);
    assert(dataToWrite != nil);

    BOOL success;

    //Create a path to the preference file to write to
    NSString *fullPathToDataFile = [PreferenceHelper fullPathToPreferenceFileInDocumentsDirectory:preferenceFile];

    if (fullPathToDataFile != nil) {
        success = [dataToWrite writeToFile:fullPathToDataFile atomically:YES];
    }
    else {
        success = NO;
    }

    return (success);
}


+ (NSData *)readDataFromPropertyListPreferenceFile:(NSString *)preferenceFile {
    NSData *dataToReturn;

    //Create a path to the preference file to read from
    NSString *fullPathToDataFile = [PreferenceHelper fullPathToPreferenceFileInDocumentsDirectory:preferenceFile];

    if (fullPathToDataFile != nil) {
        dataToReturn = [NSData dataWithContentsOfFile:fullPathToDataFile];
    }
    else {
        dataToReturn = nil;
    }

    return (dataToReturn);
}


@end
