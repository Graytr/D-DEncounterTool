//
//  Monster.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monster : NSObject


//Basic Info
@property NSString  *name;
@property NSString  *family;
@property NSString  *type;
@property NSString  *size;
@property NSString  *align;
@property NSInteger AC;
@property NSString  *ACType;
@property NSInteger CR;
@property NSString  *HPFormula;
@property NSInteger averageHP;
@property NSString  *speed;
@property NSInteger baseAttackBonus;
@property NSInteger grappleBonus;
@property NSString  *initiativeDescriptor;
@property NSInteger initiative;

//Ability Scores
@property NSInteger strength;
@property NSInteger dexterity;
@property NSInteger constitution;
@property NSInteger wisdom;
@property NSInteger intellegence;
@property NSInteger charisma;

//Saving Throws
@property NSInteger fortitudeSave;
@property NSInteger willSave;
@property NSInteger reflexSave;

//Skills, feats, etc.
@property NSArray   *skills;
@property NSArray   *specialQualities;
@property NSArray   *feats;
@property NSArray   *epicFeats;

//Attacks
@property NSString  *attack;
@property NSString  *fullAttack;

//Detailed Info
@property NSInteger space;
@property NSInteger reach;
@property NSString  *specialAttacks;
@property NSString  *damageResistance;
@property NSString  *damageImmunity;
@property NSString  *conditionImmunity;
@property NSArray   *languages;
@property NSString  *treasure;

//Roleplaying
@property NSString  *description;
@property NSString  *tacticsDescription;
@property NSString  *actions;
@property NSString  *environment;
@property NSString  *organization;
@property NSString  *advancement;

//Book
@property NSString  *reference;


-(NSString*)toString;


@end
