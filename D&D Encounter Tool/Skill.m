//
//  Skill.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "Skill.h"

@implementation Skill

-(Skill*)initWithString:(NSString*)aString{
    // Just covering our butts
    if (aString.length == 0) {
        return self;
    }
    
    // The set containing everything except digits
    NSMutableCharacterSet *nonDigitCharacterSet = [[[NSMutableCharacterSet decimalDigitCharacterSet] invertedSet] mutableCopy];
    [nonDigitCharacterSet addCharactersInString:@"-"];
    
    // Extract the value
    NSArray *values = [aString componentsSeparatedByCharactersInSet:nonDigitCharacterSet];
    self.modifier = [values[0] integerValue];
    
    // Extract the name
    self.skillName = [aString substringToIndex:aString.length - [NSString stringWithFormat:@"%lu", self.modifier].length];
    
    // Butt covering again
    if (self.skillName.length <= 1) {
        return self;
    }
    
    // Remove the plus sign if there is one
    if ([[self.skillName substringFromIndex:self.skillName.length-1] isEqualToString:@"+"]) {
        self.skillName = [self.skillName substringToIndex:self.skillName.length-2];
    }
    
    return self;
}

-(NSString*)convertToString{
    if (self.modifier >= 0) {
        return [NSString stringWithFormat:@"+%ld %@", (long)self.modifier, self.skillName];
    } else {
        return [NSString stringWithFormat:@"%ld %@", (long)self.modifier, self.skillName];
    }
}

@end
