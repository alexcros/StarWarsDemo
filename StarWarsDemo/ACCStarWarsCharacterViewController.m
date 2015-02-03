//
//  ACCStarWarsCharacterViewController.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

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
    
    [self syncWithModel];
}

#pragma mark - UISplitViewControllerDelegate

// turn

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)button
{
    //remove button from navigation bar in detail navigation controller
    ((UINavigationController*)[svc.viewControllers objectAtIndex:1]).topViewController.navigationItem.rightBarButtonItem = nil;;
}

// init

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc{
    
    //add button to navigation bar in detail navigation controller
    
    barButtonItem.title = @"Navigation";
    ((UINavigationController*)[svc.viewControllers objectAtIndex:1]).topViewController.navigationItem.rightBarButtonItem = barButtonItem;
    
}

#pragma mark - ACCStarWarsUTableViewControllerDelegate

-(void) starWarsUTableViewController:(ACCStarWarsUTableViewController*) swuTableVC
                  didSelectCharacter:(ACCStarWarsCharacter*) character
{
    
    // new character selected
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

-(IBAction)playSound:(id)sender{
    
    self.player = [CafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
    
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
