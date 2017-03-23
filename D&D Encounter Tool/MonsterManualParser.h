//
//  MonsterManualParser.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-22.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Monster.h"
#import "Skill.h"


@interface MonsterManualParser : NSObject <NSXMLParserDelegate>

@property NSString          *curElement;
@property NSMutableArray    *monsters;
@property Monster           *curMonster;    //Monster currently being parsed
@property NSXMLParser       *xmlParser;

-(void)runParser;

@end
