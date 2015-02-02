//
//  ACCStarWarsUTableViewController.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//
/*
 #import "AGTStarWarsUniverseViewController.h"
 #import "AGTStarWarsUniverse.h"
 #import "AGTCharacterViewController.h"
 
 @interface AGTStarWarsUniverseViewController ()
 @property (strong, nonatomic) AGTStarWarsUniverse *model;
 @end
 
 @implementation AGTStarWarsUniverseViewController
 
 -(id) initWithModel:(AGTStarWarsUniverse *) model
 style:(UITableViewStyle) style{
 
 if (self = [super initWithStyle:style]) {
 _model = model;
 self.title = @"Star Wars";
 }
 return self;
 
 }
 */

#import "ACCStarWarsUTableViewController.h"
#import "ACCStarWarsUniverse.h"
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    // Averiguar de que personaje me están hablando
    ACCStarWarsCharacter *character;
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    }else{
        character = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    // crear una celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId]; // create cell var
    
    if (cell == nil) {
        // tengo que crear la celda si no se creo anteriormente
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:cellId];
    }
    
    // sincronizar modelo (personaje) -> vista (celda)
    cell.imageView.image = character.photo;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = character.name;
    
    // La devuelvo
    return cell;
    
}

#pragma mark - Table Delegate
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // averiguar de que persoanje se trata
    ACCStarWarsCharacter *character;
    
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    }else{
        character = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    if ([self.delegate respondsToSelector:@selector(starWarsUTableViewController:didSelectCharacter:)]) {
        // Entiende el mensaje se lo mando
        [self.delegate starWarsUTableViewController:self
                                 didSelectCharacter:character];
        
    }
    
    // Enviamos una notificación
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSDictionary *info = @{CHARACTER_KEY : character};
    
    NSNotification *n = [NSNotification
                         notificationWithName:CHARACTER_DID_CHANGE_NOTIFICATION_NAME
                         object:self
                         userInfo:info];
    
    [nc postNotification:n];
    
}


#pragma mark -  ACCStarWarsUTableViewControllerDelegate

-(void) starWarsUTableViewController:(ACCStarWarsUTableViewController *) swuTableVC
                    didSelectCharacter:(ACCStarWarsCharacter *)character{
    
    // Crear un CharacterVC
    ACCStarWarsCharacterViewController *charVC = [[ACCStarWarsCharacterViewController alloc]initWithModel:character];

    // Pushearlo
    [self.navigationController pushViewController:charVC
                                         animated:YES];
    
}
/*
 #pragma mark -  AGTStarWarsUniverseViewControllerDelegate
 -(void) starWarsUniverseViewController:(AGTStarWarsUniverseViewController *)uVC
 didSelectCharacter:(AGTStarWarsCharacter *)character{
 
 
 // Crear un CharacterVC
 AGTCharacterViewController *charVC = [[AGTCharacterViewController alloc] initWithModel:character];
 
 
 // Pushearlo
 [self.navigationController pushViewController:charVC
 animated:YES];
 
 
 }
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
