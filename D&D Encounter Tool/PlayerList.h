//
//  PlayerList.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-21.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerList : NSObject

+(NSArray*)getPlayers;
+(BOOL)savePlayersWithArrayOfPlayers:(NSArray *)players;

@end
