//
//  ACCStarWarsCharacterViewController.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//
/*
 
 @import UIKit;
 
 #import "AGTStarWarsCharacter.h"
 #import "CafPlayer.h"
 #import "AGTStarWarsUniverseViewController.h"
 
 @interface AGTCharacterViewController : UIViewController <UISplitViewControllerDelegate, AGTStarWarsUniverseViewControllerDelegate>
 
 
 @property (strong, nonatomic) AGTStarWarsCharacter *model;
 @property (weak, nonatomic) IBOutlet UIImageView *photoView;
 @property (strong, nonatomic) CafPlayer *player;
 
 
 -(id) initWithModel:(AGTStarWarsCharacter*)model;
 
 
 -(IBAction)playSound:(id)sender;
 -(IBAction)displayWikipedia:(id)sender;
 
 
 
 
 @end
 
 */
#import <UIKit/UIKit.h>
#import "ACCStarWarsCharacter.h"
#import "ACCStarWarsUTableViewController.h"

@interface ACCStarWarsCharacterViewController : UIViewController <UISplitViewControllerDelegate,
ACCStarWarsUTableViewControllerDelegate> // esta clase es delegado del splitVC y de TableVC

@property (weak,nonatomic) ACCStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView; // link to .xib

-(id) initWithModel: (ACCStarWarsCharacter*) model;

@end
