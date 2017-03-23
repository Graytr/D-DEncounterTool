//
//  PreferenceHelper.h
//  iCS
//
//  Created by Chad Jones on 04/06/09.
//  Copyright 2009 CollegeMobile, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreferenceHelper : NSObject {
}


+ (NSString *)fullPathToDocumentsDirectory;

+ (NSString *)fullPathToPreferenceFileInDocumentsDirectory:(NSString *)preferenceFile;

+ (NSDictionary *)readDictionaryFromPropertyListPreferenceFile:(NSString *)preferenceFile;

+ (BOOL)writeToPropertyListPreferenceFile:(NSString *)preferenceFile dictionaryToWrite:(NSDictionary *)dictionaryToWrite;

+ (NSData *)readDataFromPropertyListPreferenceFile:(NSString *)preferenceFile;

+ (BOOL)writeToPropertyListPreferenceFile:(NSString *)preferenceFile dataToWrite:(NSData *)dataToWrite;

@end
