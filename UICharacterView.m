//
//  UICharacterView.m
//  D&D Encounter Tool
//
//  Created by Travis Gray on 2017-03-21.
//  Copyright © 2017 Travis Gray. All rights reserved.
//

#import "UICharacterView.h"

@interface UICharacterView()
@property (strong, nonatomic) IBOutlet UIView *characterView;


@end


@implementation UICharacterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self customInit];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self customInit];
    return self;
}

-(void) customInit{
    [[NSBundle mainBundle] loadNibNamed:@"UICharacterView" owner:self options:nil];
    [self addSubview:self.characterView];
    self.characterView.frame = self.bounds;
    
    [self setLabels];
}

-(void)setLabels{
                         self.nameLabel.text = self.curMonster.name;
                           self.CRLabel.text = [NSString stringWithFormat:@"%@", self.curMonster.CR];
                self.sizeAndFamilyLabel.text = [NSString stringWithFormat:@"%@ %@", self.curMonster.size, self.curMonster.family];
                    self.alignmentLabel.text = self.curMonster.align;
                           self.acLabel.text = [NSString stringWithFormat:@"%@", self.curMonster.AC];
                    self.HPFormulaLabel.text = self.curMonster.HPFormula;
                    self.averageHPLabel.text = [NSString stringWithFormat:@"%@",self.curMonster.averageHP];
                        self.speedLabel.text = self.curMonster.speed;
                  self.descriptionLabel.text = self.curMonster.ACType;
    self.baseAttackBonusAndGrappleLabel.text = [NSString stringWithFormat:@"+%ld/+%ld", (long)self.curMonster.baseAttackBonus, (long)self.curMonster.grappleBonus];
                     self.strengthLabel.text = [NSString stringWithFormat:@"%@", self.curMonster.strength];
                    self.dexterityLabel.text = [NSString stringWithFormat:@"%@", self.curMonster.dexterity];
                 self.constitutionLabel.text = [NSString stringWithFormat:@"%@", self.curMonster.constitution];
                 self.intelligenceLabel.text = [NSString stringWithFormat:@"%@", self.curMonster.intellegence];
                       self.wisdomLabel.text = [NSString stringWithFormat:@"%@", self.curMonster.wisdom];
                     self.charismaLabel.text = [NSString stringWithFormat:@"%@", self.curMonster.charisma];
                        self.savesLabel.text = [NSString stringWithFormat:@"Fort: %@, Reflex: %@, Will: %@",
                                                self.curMonster.fortitudeSave, self.curMonster.reflexSave, self.curMonster.willSave];
                       self.skillsLabel.text = [self.curMonster.skills componentsJoinedByString:@", "];
                       self.sensesLabel.text = [self.curMonster.specialQualities componentsJoinedByString:@", "];
                        self.featsLabel.text = [self.curMonster.feats componentsJoinedByString:@", "];
}

@end











