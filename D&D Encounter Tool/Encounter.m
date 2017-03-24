//
//  Encounter.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "Encounter.h"

@implementation Encounter

-(NSInteger)encounterCR{
    // Create a formula using the individual monster CRs
    return 0L;
}

-(void)addToEncounterWithMonster:(Monster*)monster{
    if (self.monsterArray) {
        [self.monsterArray addObject:monster];
    } else {
        self.monsterArray = [[NSMutableArray alloc] initWithObjects:monster, nil];
    }
}

-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    self.encounterName = [dictionary valueForKey:@"name"];
    self.monsterArray  = [self mutableArrayOfMonstersWithArrayOfMonsterDictionaries:[dictionary valueForKey:@"monsters"]];
    return self;
}

-(NSDictionary*)asDictionary{
    NSLog(@"AsDictFunct: %@", self.encounterName);
    return [NSDictionary dictionaryWithObjectsAndKeys:self.encounterName, @"name", [self arrayOfMonsterDictionariesWithMonsterArray:self.monsterArray], @"monsters", nil];
}

-(NSArray*)arrayOfMonsterDictionariesWithMonsterArray:(NSArray*)monsterArray{
    NSMutableArray* dictionaryArray = [[NSMutableArray alloc] init];
    for (Monster* monster in monsterArray) {
        [dictionaryArray addObject:[monster toDictionary]];
    }
    return [dictionaryArray copy];
}

-(NSMutableArray*)mutableArrayOfMonstersWithArrayOfMonsterDictionaries:(NSArray*)monsterDicts{
    NSMutableArray* monsterArray = [[NSMutableArray alloc] init];
    for (NSDictionary* dict in monsterDicts) {
        [monsterArray addObject:[[Monster alloc] initWithDictionary:dict]];
    }
    return monsterArray;
}

@end
