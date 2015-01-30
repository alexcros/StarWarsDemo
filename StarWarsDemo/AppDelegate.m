//
//  AppDelegate.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "AppDelegate.h"
#import "ACCStarWarsUniverse.h"
#import "ACCStarWarsUTableViewController.h"
#import "ACCStarWarsCharacterViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Screen Type: iPhone or iPad
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        // tableta
        [self configureForPad];
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
// iPad cfg
-(void)configureForPad{
    
    // 1. import and Init] alloc Model
    ACCStarWarsUniverse *swuModel = [[ACCStarWarsUniverse alloc]init];
    
    // 2. import and Create StarWarsUniverseController and insert swuModel
    ACCStarWarsUTableViewController *swuTableVC = [[ACCStarWarsUTableViewController alloc]initWithModel:swuModel
                                                                                                  style:UITableViewStylePlain];
    // 3. Create StarWarsCharacterViewController with .xib for imperial and rebel, this controller will show the characters
    ACCStarWarsCharacterViewController *charVC = [[ACCStarWarsCharacterViewController alloc]
                                                  initWithModel:[swuModel imperialCharacterAtIndex:0]];// Call swuModel.imperialChar property
    
    //4.1 combinador 1. Inicializamos y colocamos en memoria un navigator para el tableView personajes y push StarWarsUniverseController
    // Creamos los combinadores: Navigation Controllers
    UINavigationController *tableNav = [[UINavigationController alloc]init];
    // push TableVC
   [tableNav pushViewController:swuTableVC
                animated:NO];
    //4.2 combinador 2: Inicializamos y colocamos en memoria otro controlador de navegador: cargamos el StarWarsCharacterViewController xib
    UINavigationController *charNav = [[UINavigationController alloc] init];
    
    [charNav pushViewController:charVC
                       animated:NO];

    // 5. Iniciamos SplitVC: por orden colocamos los navegadores 5.1.la tabla StarWarsUniverse a la izquierda y 2. nav. StarWarsCharacter a la derecha
    
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    [splitVC setViewControllers:@[tableNav, charNav]]; //set VC to split
    
    // 6. Asignamos como delegado a charVC StarWarsCharacterViewController characteres
    
    // Asignamos delegados
    splitVC.delegate = charVC;
    swuTableVC.delegate = charVC;
    // 7. Asignamos SplitVC// Lo asignamos como root, carga la window en appdelegate
    self.window.rootViewController = splitVC;
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
