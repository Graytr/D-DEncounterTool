//
//  Encounter.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encounter : NSObject

@property NSString  *encounterName;
@property NSInteger *encounterCR;
@property NSArray   *monsterArray;

@end
