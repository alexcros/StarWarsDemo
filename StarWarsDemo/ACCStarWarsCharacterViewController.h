//
//  ACCStarWarsCharacterViewController.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//
/*
 
 #import "CafPlayer.h"
 
 

 @property (strong, nonatomic) CafPlayer *player;
 
 
 -(IBAction)playSound:(id)sender;
 
 @end
 
 */
#import <UIKit/UIKit.h>
#import "ACCStarWarsCharacter.h"
#import "ACCStarWarsUTableViewController.h"

@interface ACCStarWarsCharacterViewController : UIViewController <UISplitViewControllerDelegate> // esta clase es delegado del splitVC y de TableVC

@property (weak,nonatomic) ACCStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView; // link to .xib

-(id) initWithModel: (ACCStarWarsCharacter*) model;
-(IBAction)displayWikipedia:(id)sender;

@end