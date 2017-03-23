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
    [self.monsterArray addObject:monster];
}

-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    self.encounterName = [dictionary valueForKey:@"name"];
    self.monsterArray  = [dictionary valueForKey:@"monsters"];
    return self;
}

-(NSDictionary*)asDictionary{
    return [NSDictionary dictionaryWithObjectsAndKeys:self.encounterName, @"name", self.monsterArray, @"monsters", nil];
}

@end
