//
//  SecondViewController.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-21.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerList.h"
#import "EncounterList.h"
#import "MonsterManualParser.h"
#import "Encounter.h"

@interface MonsterViewController : UIViewController

@property MonsterManualParser *monsterParser;
@property Encounter *curEncounter;

@end

