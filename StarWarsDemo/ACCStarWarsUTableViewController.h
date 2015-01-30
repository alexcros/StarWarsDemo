//
//  ACCStarWarsUTableViewController.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//
/*
 #define REBEL_SECTION 1
 #define IMPERIAL_SECTION 0
 
 #define CHARACTER_DID_CHANGE_NOTIFICATION_NAME @"CHARACTER"
 #define CHARACTER_KEY @"CHARACTERKEY"
 
 
 @import UIKit;
 
 #import "AGTStarWarsUniverse.h"
 
 
 @class AGTStarWarsUniverseViewController;
 
 @protocol AGTStarWarsUniverseViewControllerDelegate <NSObject>
 
 @optional
 -(void)starWarsUniverseViewController:(AGTStarWarsUniverseViewController*) uVC
 didSelectCharacter:(AGTStarWarsCharacter*) character;
 
 -(void) starWarsUniverseViewController:(AGTStarWarsUniverseViewController*) uVC
 willSelectCharacter:(AGTStarWarsCharacter*) character;
 
 @end
 
 
 
 @interface AGTStarWarsUniverseViewController : UITableViewController<AGTStarWarsUniverseViewControllerDelegate>
 
 @property (weak,nonatomic) id<AGTStarWarsUniverseViewControllerDelegate> delegate;
 
 -(id) initWithModel:(AGTStarWarsUniverse *) model
 style:(UITableViewStyle) style;
 
 @end

 */

#import <UIKit/UIKit.h>
#import "ACCStarWarsUniverse.h" // for import StarWarsUniverse model
#import "ACCStarWarsUTableViewController.h"

@class ACCStarWarsUTableViewController; // compiler don't disturb

@protocol ACCStarWarsUTableViewControllerDelegate <NSObject> // create our protocol msg

@optional // delegate methods did and will
-(void)starWarsUTableViewController:(ACCStarWarsUTableViewController*) swuTableVC
                        didSelectCharacter:(ACCStarWarsCharacter*) character;

-(void)starWarsUTableViewController:(ACCStarWarsUTableViewController *)swuTableVC
                willSelectCharacter:(ACCStarWarsCharacter *)character;

@end

@interface ACCStarWarsUTableViewController : UITableViewController <ACCStarWarsUTableViewControllerDelegate> // class knows the new protocol

@property (weak,nonatomic) id<ACCStarWarsUTableViewControllerDelegate> delegate; // property delegate

-(id) initWithModel:(ACCStarWarsUniverse*) model // import StarWars Universe model
              style:(UITableViewStyle) style; // TableView property

@end
