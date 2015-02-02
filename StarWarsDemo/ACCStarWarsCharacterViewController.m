//
//  ACCStarWarsCharacterViewController.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//
/*
 
 #import "AGTCharacterViewController.h"
 #import "CafPlayer.h"
 #import "AGTWikiViewController.h"
 
 @implementation AGTCharacterViewController
 
 
 
 */
#import "ACCStarWarsCharacterViewController.h"
#import "WikiViewController.h"

@implementation ACCStarWarsCharacterViewController

-(id) initWithModel: (ACCStarWarsCharacter*)model{ //init ACCStarWarsChar model
    
    if(self = [super initWithNibName:nil // default
                              bundle:nil]){
        
        _model = model;
        self.title = model.alias; // set title with alias
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // sincronizo modelo -> vista
    [self syncWithModel];
}

#pragma mark - UISplitViewControllerDelegate
-(void)splitViewController:(UISplitViewController *)svc
   willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        // Hay que poner el botón en mi barra de navegación
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
        
        
    }else if (displayMode == UISplitViewControllerDisplayModeAllVisible){
        // Hay que quitar el botón de la barra de navegación (pareado incluido)
        self.navigationItem.rightBarButtonItem = nil;
        
    }
}

#pragma mark - ACCStarWarsUTableViewControllerDelegate

-(void) starWarsUTableViewController:(ACCStarWarsUTableViewController*) swuTableVC
                  didSelectCharacter:(ACCStarWarsCharacter*) character
{
    
    
    // me dicen que cambie mi modelo
    self.model = character;
    [self syncWithModel];
    
}





#pragma mark - Utils
-(void) syncWithModel{
    // IBAction = photo model
    self.photoView.image = self.model.photo;
    self.title = self.model.alias;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)displayWikipedia:(id)sender{
    
    // Crear un WikiVC
    WikiViewController *wikiVC = [[WikiViewController alloc] initWithModel:self.model];
    
    // Pushearlo
    [self.navigationController pushViewController:wikiVC
                                         animated:YES];

  
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
