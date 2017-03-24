//
//  SecondViewController.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-21.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "MonsterViewController.h"


@interface MonsterViewController ()

@property (weak, nonatomic) IBOutlet UITextField    *name;
@property (weak, nonatomic) IBOutlet UITextField    *encounter;
@property (weak, nonatomic) IBOutlet UITextField    *monster;
@property (weak, nonatomic) IBOutlet UIButton       *addNewPlayerButton;
@property (weak, nonatomic) IBOutlet UIButton       *clearAllPlayersButton;
@property (weak, nonatomic) IBOutlet UIButton       *addNewEncounterButton;
@property (weak, nonatomic) IBOutlet UIButton       *clearAllEncountersButton;
@property (weak, nonatomic) IBOutlet UIButton       *addMonsterToEncounterButton;
@property (weak, nonatomic) IBOutlet UILabel        *monstersInEncounterLabel;

@end

@implementation MonsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    self.monsterParser = [[MonsterManualParser alloc] init];
    [self.monsterParser runParser];

    self.curEncounter = [[Encounter alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addNewPlayer:(id)sender{
    NSString *playerName = self.name.text;
    NSArray *a = [[PlayerList getPlayers] arrayByAddingObject:playerName];
    [PlayerList savePlayersWithArrayOfPlayers:a];
}

-(IBAction)clearAllPlayers:(id)sender{
    [PlayerList savePlayersWithArrayOfPlayers:[NSArray array]];
}

-(IBAction)addMonsterToEncounter:(id)sender{

    for (Monster* monster in self.monsterParser.monsters) {
        if ([monster.name isEqualToString:self.monster.text]) {
            
            NSString *aString = [NSString stringWithFormat:@"%@\n%@", self.monstersInEncounterLabel.text, monster.name];
            NSLog(@"%@", aString);
            self.monstersInEncounterLabel.text = aString;
            self.monster.text = @"";
            [self.curEncounter addToEncounterWithMonster:monster];
            break;
        }
    }

}

-(IBAction)addNewEncounter:(id)sender{
    self.curEncounter.encounterName = self.encounter.text;
    self.encounter.text = @"";
    
    NSArray *a = [[EncounterList getEncounters] arrayByAddingObject:[self.curEncounter asDictionary]];
 
    [EncounterList saveEncountersWithArrayOfEncounters:a];
    self.curEncounter = [[Encounter alloc] init];
}

-(IBAction)clearAllEncounters:(id)sender{
    [EncounterList saveEncountersWithArrayOfEncounters:[NSArray array]];
}


// Dont remove: stops crashing
-(void)inputPlayer:(id)sender{}


@end
