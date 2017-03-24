//
//  DiceRoller.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-24.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Monster.h"

@interface DiceRoller : NSObject

-(NSInteger)rollDiceWithString:(NSString*)rollString;

-(NSInteger)rollInitiativeWithMonster:(Monster*)monster;
-(NSInteger)rollHPWithMonster:(Monster*)monster;



@end
