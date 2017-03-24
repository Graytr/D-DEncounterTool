//
//  Skill.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Skill : NSObject

@property NSString  *skillName;
@property NSInteger modifier;

-(Skill*)initWithString:(NSString*)aString;
-(NSString*)convertToString;

@end
