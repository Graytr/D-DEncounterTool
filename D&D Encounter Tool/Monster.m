//
//  Monster.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "Monster.h"

@implementation Monster

-(NSString*)toString{
    return [NSString stringWithFormat:@"%@", self.name];
}

-(id)initWithEmptyStrings{
    self = [super init];
    self.name = @"";
    self.family = @"";
    self.type = @"";
    self.align = @"";
    self.AC = @(0);
    self.ACType = @"";
    self.CR = @(0);
    self.HPFormula = @"";
    self.averageHP = @(0);
    self.speed = @"";
    self.baseAttackBonus = @(0);
    self.grappleBonus = @(0);
    self.initiativeDescriptor = @"";
    self.initiative = @(0);
    self.strength = @(0);
    self.dexterity = @(0);
    self.constitution = @(0);
    self.wisdom = @(0);
    self.intellegence = @(0);
    self.charisma = @(0);
    self.fortitudeSave = @(0);
    self.willSave = @(0);
    self.reflexSave = @(0);
    self.skills = [[NSArray alloc] init];
    self.specialQualities = [[NSArray alloc] init];
    self.feats = [[NSArray alloc] init];
    self.epicFeats = [[NSArray alloc] init];
    self.attack = @"";
    self.fullAttack = @"";
    self.space = @(0);
    self.reach = @(0);
    self.specialAttacks = @"";
    self.damageResistance = @"";
    self.damageImmunity = @"";
    self.conditionImmunity = @"";
    self.languages = [[NSArray alloc] init];
    self.treasure = @"";
    self.monsterDescription = @"";
    self.tacticsDescription = @"";
    self.actions = @"";
    self.environment = @"";
    self.organization = @"";
    self.advancement = @"";
    self.reference = @"";
    return self;
}

-(NSDictionary*)toDictionary{
    return [[NSDictionary alloc] initWithObjectsAndKeys:
                                self.name, @"name",
                              self.family, @"family",
                                self.type, @"type",
                                self.size, @"size",
                               self.align, @"align",
                                  self.AC, @"AC",
                              self.ACType, @"ACType",
         [NSString stringWithFormat:@"%@", self.CR], @"CR",
                           self.HPFormula, @"HPFormula",
                           self.averageHP, @"averageHP",
                               self.space, @"speed",
                     self.baseAttackBonus, @"baseAttackBonus",
                        self.grappleBonus, @"grappleBonus",
                self.initiativeDescriptor, @"initiativeDescriptor",
                          self.initiative, @"initiative",
                            self.strength, @"strength",
                           self.dexterity, @"dexterity",
                        self.constitution, @"constitution",
                              self.wisdom, @"wisdom",
                        self.intellegence, @"intellegence",
                            self.charisma, @"charisma",
                       self.fortitudeSave, @"fortitudeSave",
                            self.willSave, @"willSave",
                          self.reflexSave, @"reflexSave",
            [self skillsAsArrayOfStrings], @"skills",
                    self.specialQualities, @"specialQualities",
                               self.feats, @"feats",
                           self.epicFeats, @"epicFeats",
                              self.attack, @"attack",
                          self.fullAttack, @"fullAttack",
                               self.space, @"space",
                               self.reach, @"reach",
                      self.specialAttacks, @"specialAttacks",
                    self.damageResistance, @"damageResistance",
                      self.damageImmunity, @"damageImmunity",
                   self.conditionImmunity, @"conditionImmunity",
                           self.languages, @"languages",
                            self.treasure, @"treasure",
                         self.description, @"description",
                  self.tacticsDescription, @"tacticsDescription",
                             self.actions, @"actions",
                         self.environment, @"environment",
                        self.organization, @"organization",
                         self.advancement, @"advancement",
                           self.reference, @"reference",
     nil];
}

-(NSArray*)skillsAsArrayOfStrings{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (Skill* skill in self.skills) {
        [array addObject:[skill convertToString]];
    }
    return [array copy];
}

-(id)initWithDictionary:(NSDictionary *)monsterDict{
        self = [super init];
        self.name = [monsterDict valueForKey:@"name"];
        self.family = [monsterDict valueForKey:@"family"];
        self.type = [monsterDict valueForKey:@"type"];
        self.align = [monsterDict valueForKey:@"align"];
        self.AC = [monsterDict valueForKey:@"AC"];
        self.ACType = [monsterDict valueForKey:@"ACType"];
        self.CR = [monsterDict valueForKey:@"CR"];
        self.HPFormula = [monsterDict valueForKey:@"HPFormula"];
        self.averageHP = [monsterDict valueForKey:@"averageHP"];
        self.speed = [monsterDict valueForKey:@"speed"];
        self.baseAttackBonus = [monsterDict valueForKey:@"baseAttackBonus"];
        self.grappleBonus = [monsterDict valueForKey:@"grappleBonus"];
        self.initiativeDescriptor = [monsterDict valueForKey:@"initiativeDescriptor"];
        self.initiative = [monsterDict valueForKey:@"initiative"];
        self.strength = [monsterDict valueForKey:@"strength"];
        self.dexterity = [monsterDict valueForKey:@"dexterity"];
        self.constitution = [monsterDict valueForKey:@"constitution"];
        self.wisdom = [monsterDict valueForKey:@"wisdom"];
        self.intellegence = [monsterDict valueForKey:@"intellegence"];
        self.charisma = [monsterDict valueForKey:@"charisma"];
        self.fortitudeSave = [monsterDict valueForKey:@"fortitudeSave"];
        self.willSave = [monsterDict valueForKey:@"willSave"];
        self.reflexSave = [monsterDict valueForKey:@"reflexSave"];
        self.skills = [monsterDict valueForKey:@"skills"];
        self.specialQualities = [monsterDict valueForKey:@"specialQualities"];
        self.feats = [monsterDict valueForKey:@"feats"];
        self.epicFeats = [monsterDict valueForKey:@"epicFeats"];
        self.attack = [monsterDict valueForKey:@"attack"];
        self.fullAttack = [monsterDict valueForKey:@"fullAttack"];
        self.space = [monsterDict valueForKey:@"space"];
        self.reach = [monsterDict valueForKey:@"reach"];
        self.specialAttacks = [monsterDict valueForKey:@"specialAttacks"];
        self.damageResistance = [monsterDict valueForKey:@"damageResistance"];
        self.damageImmunity = [monsterDict valueForKey:@"damageImmunity"];
        self.conditionImmunity = [monsterDict valueForKey:@"conditionImmunity"];
        self.languages = [monsterDict valueForKey:@"languages"];
        self.treasure = [monsterDict valueForKey:@"treasure"];
        self.monsterDescription = [monsterDict valueForKey:@"monsterDescription"];
        self.tacticsDescription = [monsterDict valueForKey:@"tacticsDescription"];
        self.actions = [monsterDict valueForKey:@"actions"];
        self.environment = [monsterDict valueForKey:@"environment"];
        self.organization = [monsterDict valueForKey:@"organization"];
        self.advancement = [monsterDict valueForKey:@"advancment"];
        self.reference = [monsterDict valueForKey:@"reference"];
        return self;
}

@end
