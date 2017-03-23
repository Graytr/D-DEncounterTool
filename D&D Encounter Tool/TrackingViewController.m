//
//  FirstViewController.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-21.
//  Copyright © 2017 Travis Gray. All rights reserved.
//





//TODO:
/*
 set up the table to load an encounter
 this means i have to set up making encounters
 when you touch a monster from the tracking table, it comes up in the monster view
 when you touch a character from the tracking table, they come up in the monster view
 then be able to set the next init
 more initiative stuff as well
 have the monsters in the table have hp rolled
 have the monsters in the table take damage
 */

#import "TrackingViewController.h"
#import "PlayerList.h"
#import "EncounterList.h"

@interface TrackingViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView   *encounterPicker;
@property (weak, nonatomic) IBOutlet UIButton       *loadPlayersButton;
@property (weak, nonatomic) IBOutlet UIButton       *nextInitiativeButton;
@property (weak, nonatomic) IBOutlet UITableView    *trackingTable;
@property (weak, nonatomic) IBOutlet UICharacterView *characterView;


@property NSArray* players;
@property NSArray* encounters;
@property NSMutableArray* curTracking;


@end

@implementation TrackingViewController

// Import players
// Import current encounter
// Don't import again until a refresh
// have initiative entering
// have initiative sorting
// have death
//

-(void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Tracking"];
    if (self.curTracking == nil || self.curTracking.count == 0) {
        self.curTracking = [[NSMutableArray alloc] init];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    //  Import players from file.
    //  Must do this on every viewDidAppear (vs viewDidLoad) due to the user
    //      being able to update the player list on the next tab (and we
    //      want to have the most updated one)
    self.players    = [PlayerList       getPlayers];
    self.encounters = [EncounterList getEncounters];
    [self.view addSubview:self.trackingTable];
    
}

//  Adds players (but only those who aren't already) to the tracking table.
//  This button does not reset the health, initiative, or other values of
//      the players that are already in the table.
-(IBAction)addPlayersToTracking:(id)sender {
    for (NSString* player in self.players) {
        if ([self.curTracking containsObject:player]) {
            // do nothing, because the player is already there
        } else {
            [self.curTracking addObject:player];
        }
    }

    [self.trackingTable reloadData];
    [self.trackingTable setScrollEnabled:YES];
}

-(IBAction)nextInInitiative:(id)sender {
    
}


#pragma mark - Tag Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.curTracking.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }

    long index = [indexPath row];
    
    NSString *displayName = [[NSString alloc] init];
    if ([self.curTracking[index] isKindOfClass:[NSString class]]) {
        displayName = self.curTracking[index];
    } else { // Then it is a monster
        displayName = ((Monster*)self.curTracking[index]).name;
    }
    
    cell.textLabel.text = displayName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    return cell;
}




-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
