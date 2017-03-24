//
//  DiceRoller.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-24.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "DiceRoller.h"

@implementation DiceRoller

-(NSInteger)rollDiceWithString:(NSString *)rollString{
    return 0;
}

-(NSInteger)rollHPWithMonster:(Monster *)monster{
    return [self rollDiceWithString:monster.HPFormula];
}



-(NSInteger)rollInitiativeWithMonster:(Monster *)monster{
    NSString* formula = [NSString stringWithFormat:@"1d20+%@", monster.initiative];
    return [self rollDiceWithString:formula];
}

@end
