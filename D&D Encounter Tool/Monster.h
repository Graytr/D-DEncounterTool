//
//  Monster.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Skill.h"

@interface Monster : NSObject


//Basic Info
@property NSString  *name;
@property NSString  *family;
@property NSString  *type;
@property NSString  *size;
@property NSString  *align;
@property NSNumber  *AC;
@property NSString  *ACType;
@property NSNumber  *CR;
@property NSString  *HPFormula;
@property NSNumber  *averageHP;
@property NSString  *speed;
@property NSNumber  *baseAttackBonus;
@property NSNumber  *grappleBonus;
@property NSString  *initiativeDescriptor;
@property NSNumber  *initiative;

//Ability Scores
@property NSNumber  *strength;
@property NSNumber  *dexterity;
@property NSNumber  *constitution;
@property NSNumber  *wisdom;
@property NSNumber  *intellegence;
@property NSNumber  *charisma;

//Saving Throws
@property NSNumber  *fortitudeSave;
@property NSNumber  *willSave;
@property NSNumber  *reflexSave;

//Skills, feats, etc.
@property NSArray   *skills;
@property NSArray   *specialQualities;
@property NSArray   *feats;
@property NSArray   *epicFeats;

//Attacks
@property NSString  *attack;
@property NSString  *fullAttack;

//Detailed Info
@property NSNumber  *space;
@property NSNumber  *reach;
@property NSString  *specialAttacks;
@property NSString  *damageResistance;
@property NSString  *damageImmunity;
@property NSString  *conditionImmunity;
@property NSArray   *languages;
@property NSString  *treasure;

//Roleplaying
@property NSString  *monsterDescription;
@property NSString  *tacticsDescription;
@property NSString  *actions;
@property NSString  *environment;
@property NSString  *organization;
@property NSString  *advancement;

//Book
@property NSString  *reference;


-(NSString*)toString;
-(NSDictionary*)toDictionary;
-(id)initWithEmptyStrings;
-(id)initWithDictionary:(NSDictionary*)monsterDict;


@end
