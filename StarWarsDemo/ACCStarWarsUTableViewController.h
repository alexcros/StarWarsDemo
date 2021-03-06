//
//  ACCStarWarsUTableViewController.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

@import UIKit;
#import "ACCStarWarsUniverse.h" // for import StarWarsUniverse model

#define REBEL_SECTION 1 //definimos las categorias or sections de la tableView
#define IMPERIAL_SECTION 0

#define CHARACTER_DID_CHANGE_NOTIFICATION_NAME @"newCharacterSelected" // constantes para las notificacones del webview
#define CHARACTER_KEY @"character"

#define SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_CHARACTER_KEY @"lastCharacter"

@class ACCStarWarsUTableViewController; // compiler don't disturb

@protocol ACCStarWarsUTableViewControllerDelegate <NSObject> // create our protocol msg

@optional // delegate methods did and will
-(void)starWarsUTableViewController:(ACCStarWarsUTableViewController*) swuTableVC
                        didSelectCharacter:(ACCStarWarsCharacter*) character;

-(void)starWarsUTableViewController:(ACCStarWarsUTableViewController *)swuTableVC
                willSelectCharacter:(ACCStarWarsCharacter *)character;

@end

@interface ACCStarWarsUTableViewController : UITableViewController <ACCStarWarsUTableViewControllerDelegate> // class knows the new protocol

@property (weak,nonatomic) id<ACCStarWarsUTableViewControllerDelegate> delegate; // property delegate, selecting characters

-(id) initWithModel:(ACCStarWarsUniverse*) model // import StarWars Universe model
              style:(UITableViewStyle) style; // TableView property


-(ACCStarWarsCharacter*) lastCharacterSelected;

@end
