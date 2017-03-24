//
//  Encounter.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Monster.h"

@interface Encounter : NSObject

@property NSString *encounterName;
@property NSMutableArray *monsterArray;

-(NSInteger)encounterCR;
-(void)addToEncounterWithMonster:(Monster*)monster;

-(id)initWithDictionary:(NSDictionary*)dictionary;
-(NSDictionary*)asDictionary;

@end
