//
//  ACCStarWarsCharacterViewController.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACCStarWarsCharacter.h"
#import "ACCStarWarsUTableViewController.h"
#import "CafPlayer.h"

@interface ACCStarWarsCharacterViewController : UIViewController <UISplitViewControllerDelegate> // esta clase es delegado del splitVC y de TableVC

@property (weak,nonatomic) ACCStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView; // link to .xib
@property (strong, nonatomic) CafPlayer *player;

-(id) initWithModel: (ACCStarWarsCharacter*) model;
-(IBAction)displayWikipedia:(id)sender;
-(IBAction)playSound:(id)sender;

@end