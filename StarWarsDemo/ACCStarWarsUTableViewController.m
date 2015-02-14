//
//  ACCStarWarsUTableViewController.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//
#import "ACCStarWarsUTableViewController.h"
#import "ACCStarWarsCharacterViewController.h"

@interface ACCStarWarsUTableViewController ()
// property with model
@property (strong,nonatomic) ACCStarWarsUniverse *model;

@end

@implementation ACCStarWarsUTableViewController

-(id) initWithModel:(ACCStarWarsUniverse*) model
              style:(UITableViewStyle) style{ //UITableView property
    
    if (self = [super initWithStyle:style]) {
        _model = model;
        self.title = @"Star Wars";// top bar title
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2; // rebels and imperial
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == IMPERIAL_SECTION) {
        return [self.model imperialCount];
    }else{
        return [self.model rebelCount];
    }
}
// title in category-section
-(NSString *) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
    if (section == IMPERIAL_SECTION) {
        return @"Empire";
    }else{
        return @"Rebel Alliance";
    }
}

-(UITableViewCell*) tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Reuse Id
    static NSString *cellId = @"StarWarsCell"; // constant
    
    // Wich kind of character ?
    ACCStarWarsCharacter *character = [self characterAtIndexPath:indexPath];// select method
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId]; // create cell var
    
    if (cell == nil) {
        // new cell
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:cellId];
    }
    
    // syncro model with view
    cell.imageView.image = character.photo;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = character.name;

    return cell;
    
}

#pragma mark - Table Delegate
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // wich character?
    ACCStarWarsCharacter *character = [self characterAtIndexPath:indexPath];
    

   if ([self.delegate respondsToSelector:@selector(starWarsUTableViewController:didSelectCharacter:)]) {
        // did you know the message? push message
        [self.delegate starWarsUTableViewController:self
                                 didSelectCharacter:character];
        
   }
    
    // Sending a notification
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSNotification *n = [NSNotification
                         notificationWithName:CHARACTER_DID_CHANGE_NOTIFICATION_NAME
                         object:self
                         userInfo:@{CHARACTER_KEY: character}];
    
    [nc postNotification:n];
    
    //saving lastSelectedChar
    [self saveLastSelectedCharAtSection:indexPath.section
                                    row:indexPath.row];
    
}
    // re-used method: character index path
-(ACCStarWarsCharacter*)characterAtIndexPath:(NSIndexPath*) indexPath {

    ACCStarWarsCharacter *character = nil;
    
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    }else{
        character = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    return character;
}

#pragma mark -  ACCStarWarsUTableViewControllerDelegate

-(void) starWarsUTableViewController:(ACCStarWarsUTableViewController *) swuTableVC
                    didSelectCharacter:(ACCStarWarsCharacter *)character{
    
    // create CharacterVC
    ACCStarWarsCharacterViewController *charVC = [[ACCStarWarsCharacterViewController alloc]initWithModel:character];

    // Push
    [self.navigationController pushViewController:charVC
                                         animated:YES];
    
}
#pragma mark - NSUserDefaults

- (NSDictionary *)setDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // show the first character by default
    NSDictionary *defaultCharacterCoords = @{SECTION_KEY : @(IMPERIAL_SECTION), ROW_KEY : @0};
    
    // object assignement
    [defaults setObject:defaultCharacterCoords
                 forKey:LAST_CHARACTER_KEY];
    
    // saving (optional)
    [defaults synchronize];
    
    return defaultCharacterCoords;
}

- (void)saveLastSelectedCharAtSection:(NSUInteger)section row:(NSUInteger)row
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY : @(section),
                          ROW_KEY     : @(row)}
                 forKey:LAST_CHARACTER_KEY];
    
    [defaults synchronize]; // saving, optional
}

-(ACCStarWarsCharacter*) lastCharacterSelected {
    
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_CHARACTER_KEY];
    
    if (coords == nil) {
        // coords = nil means no key in LAST_CHARACTER_KEY
        // app loaded by the first time
        // We put a default value: the first imperial character in db
        coords = [self setDefaults];
    }
    
    // coords to indexpath
    indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey: ROW_KEY] integerValue]
                                   inSection:[[coords objectForKey: SECTION_KEY] integerValue]];
    
    // return wine by indexPath
    return [self characterAtIndexPath:indexPath];
}

@end
