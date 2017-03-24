//
//  MonsterManualParser.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "MonsterManualParser.h"

@implementation MonsterManualParser

-(void)runParser{

    //Initialize the mutable array that we're putting monsters in
    self.monsters = [[NSMutableArray alloc] init];
    
    //Get the XML data to parse
    NSString   *path = [[NSBundle mainBundle] pathForResource: @"MonsterManual" ofType: @"xml"];
    NSString   *xmlString = [NSString stringWithContentsOfFile: path
                                                      encoding: NSISOLatin1StringEncoding
                                                         error: nil];
    NSData  *xmlData = [xmlString dataUsingEncoding:NSISOLatin1StringEncoding];
        
    // Set up an NSXMLParser to use
    // Set the delegate and start parsing!
    self.xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    self.xmlParser.delegate = self;
    [self.xmlParser parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{

    // If we have a <monster> tag, start parsing a new monster
    if ([elementName isEqualToString:@"monster"]) {
        self.curMonster = [[Monster alloc] initWithEmptyStrings];
    }
    // If not then we need to keep track of the element name so
    // we know which property to set on the Monster
    else {
        self.curElement = elementName;
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    // If we have a closing </monster> tag, we're done parsing this monster, so add it to the array
    if ([elementName isEqualToString:@"monster"]) {
        [self.monsters addObject:self.curMonster];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    // Fixes a bug that occurs due to the newline being a found character
    // even though the curElement is still the old element
    // i.e) The bug was that the newline overwrote what the actual string was supposed to be.
    if ([string containsString:@"\n"]) {
        return;
    }
    
    // Work out which element we have the characters for
    // Then set the property of the Monster object
    if ([self.curElement isEqualToString:@"family"]) {
        self.curMonster.family = string;
    } else if ([self.curElement isEqualToString:@"name"]){
        self.curMonster.name = string;
    } else if ([self.curElement isEqualToString:@"size"]){
        self.curMonster.size = string;
    } else if ([self.curElement isEqualToString:@"type"]){
        self.curMonster.type = string;
    } else if ([self.curElement isEqualToString:@"descriptor"]){
        // do nothing
    } else if ([self.curElement isEqualToString:@"hit_dice"]){
        NSArray *stringArray = [string componentsSeparatedByString:@"("];
        self.curMonster.HPFormula = stringArray[0];
        self.curMonster.averageHP = @([[stringArray[1] substringToIndex:((NSString*)stringArray[1]).length-1] integerValue]);
    } else if ([self.curElement isEqualToString:@"initiative"]){
        self.curMonster.initiativeDescriptor = string;
        if ([[string substringToIndex:1] isEqualToString:@"+"]) {
            string = [string substringFromIndex:1];
        }
        NSArray* stringArray = [string componentsSeparatedByString:@" "];
        self.curMonster.initiative = @([stringArray[0] integerValue]);
    } else if ([self.curElement isEqualToString:@"speed"]){
        self.curMonster.speed = string;
    } else if ([self.curElement isEqualToString:@"armor_class"]){
        self.curMonster.ACType = string;
        NSArray *stringArray = [string componentsSeparatedByString:@" "];
        self.curMonster.AC = @([stringArray[0] integerValue]);
    } else if ([self.curElement isEqualToString:@"base_attack"]){
        // Removes the plus sign if there is one
        if ([[string substringToIndex:1] isEqualToString:@"+"]) {
            self.curMonster.baseAttackBonus = @([[string substringFromIndex:1] integerValue]);
        } else {
            self.curMonster.baseAttackBonus = @([string integerValue]);
        }
    } else if ([self.curElement isEqualToString:@"grapple"]){
        // Removes the plus sign if there is one
        if ([[string substringToIndex:1] isEqualToString:@"+"]) {
            self.curMonster.grappleBonus = @([[string substringFromIndex:1] integerValue]);
        } else {
            self.curMonster.grappleBonus = @([string integerValue]);
        }
    } else if ([self.curElement isEqualToString:@"attack"]){
        self.curMonster.attack = string;
    } else if ([self.curElement isEqualToString:@"full_attack"]){
        self.curMonster.fullAttack = string;
    } else if ([self.curElement isEqualToString:@"space"]){
        self.curMonster.space = @([string integerValue]);
    } else if ([self.curElement isEqualToString:@"reach"]){
        self.curMonster.reach = @([string integerValue]);
    } else if ([self.curElement isEqualToString:@"special_attacks"]){
        self.curMonster.specialAttacks = string;
    } else if ([self.curElement isEqualToString:@"special_qualities"]){
        self.curMonster.specialQualities = [string componentsSeparatedByString:@", "];
    } else if ([self.curElement isEqualToString:@"saves"]){
        // The set containing everything except digits
        NSMutableCharacterSet *nonDigitCharacterSet = [[[NSMutableCharacterSet decimalDigitCharacterSet] invertedSet] mutableCopy];
        [nonDigitCharacterSet addCharactersInString:@"-"];
        
        // Extract the saves
        NSArray *saves = [string componentsSeparatedByCharactersInSet:nonDigitCharacterSet];
        self.curMonster.fortitudeSave   = @([saves[0] integerValue]);
        self.curMonster.reflexSave      = @([saves[1] integerValue]);
        self.curMonster.willSave        = @([saves[2] integerValue]);
    } else if ([self.curElement isEqualToString:@"abilities"]){
        // The set containing everything except digits
        NSMutableCharacterSet *nonDigitCharacterSet = [[[NSMutableCharacterSet decimalDigitCharacterSet] invertedSet] mutableCopy];
        [nonDigitCharacterSet addCharactersInString:@"-"];
        
        // Extract the scores
        NSArray *abilityScores = [string componentsSeparatedByCharactersInSet:nonDigitCharacterSet];
        self.curMonster.strength     = @([abilityScores[0] integerValue]);
        self.curMonster.dexterity    = @([abilityScores[1] integerValue]);
        self.curMonster.constitution = @([abilityScores[2] integerValue]);
        self.curMonster.intellegence = @([abilityScores[3] integerValue]);
        self.curMonster.wisdom       = @([abilityScores[4] integerValue]);
        self.curMonster.charisma     = @([abilityScores[5] integerValue]);
    } else if ([self.curElement isEqualToString:@"skills"]){
        NSMutableArray *skills = [[NSMutableArray alloc] init];
        for (NSString *skill in [string componentsSeparatedByString:@", "]) {
            [skills addObject:[[[Skill alloc] init] initWithString:skill]];
        }
        self.curMonster.skills = [skills copy];
    } else if ([self.curElement isEqualToString:@"feats"]){
        self.curMonster.feats = [string componentsSeparatedByString:@", "];
    } else if ([self.curElement isEqualToString:@"epic_feats"]){
        self.curMonster.epicFeats = [string componentsSeparatedByString:@", "];
    } else if ([self.curElement isEqualToString:@"environment"]){
        self.curMonster.environment = string;
    } else if ([self.curElement isEqualToString:@"organization"]){
        self.curMonster.organization = string;
    } else if ([self.curElement isEqualToString:@"challenge_rating"]){
        self.curMonster.CR = @([string integerValue]);
    } else if ([self.curElement isEqualToString:@"treasure"]){
        self.curMonster.treasure = string;
    } else if ([self.curElement isEqualToString:@"alignment"]){
        self.curMonster.align = string;
    } else if ([self.curElement isEqualToString:@"advancement"]){
        self.curMonster.advancement = string;
    } else if ([self.curElement isEqualToString:@"stat_block"]){
        // do nothing
    } else if ([self.curElement isEqualToString:@"full_text"]){
        // do nothing
    } else if ([self.curElement isEqualToString:@"reference"]){
        self.curMonster.reference = string;
    }
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    // We are done parsing the monster manual
    NSLog(@"Parsed Monsters: %lu", (unsigned long)self.monsters.count);
}



@end
