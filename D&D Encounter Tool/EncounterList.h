//
//  EncounterList.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncounterList : NSObject

+(NSArray*)getEncounters;
+(BOOL)saveEncountersWithArrayOfEncounters:(NSArray *)encounters;


@end
