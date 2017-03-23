//
//  UICharacterView.h
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-21.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Monster.h"

@interface UICharacterView : UIView

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *CRLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeAndFamilyLabel;
@property (weak, nonatomic) IBOutlet UILabel *alignmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *acLabel;
@property (weak, nonatomic) IBOutlet UILabel *HPFormulaLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageHPLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *baseAttackBonusAndGrappleLabel;
@property (weak, nonatomic) IBOutlet UILabel *strengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dexterityLabel;
@property (weak, nonatomic) IBOutlet UILabel *constitutionLabel;
@property (weak, nonatomic) IBOutlet UILabel *intelligenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *wisdomLabel;
@property (weak, nonatomic) IBOutlet UILabel *charismaLabel;
@property (weak, nonatomic) IBOutlet UILabel *savesLabel;
@property (weak, nonatomic) IBOutlet UILabel *skillsLabel;
@property (weak, nonatomic) IBOutlet UILabel *sensesLabel;
@property (weak, nonatomic) IBOutlet UILabel *featsLabel;


@property Monster *curMonster;

@end
