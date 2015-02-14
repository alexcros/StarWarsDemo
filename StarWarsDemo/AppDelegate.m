//
//  AppDelegate.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "AppDelegate.h"
#import "ACCStarWarsCharacterViewController.h"
#import "ACCStarWarsCharacter.h"
#import "ACCStarWarsUniverse.h"
#import "ACCStarWarsUTableViewController.h"
#import "WikiViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Screen Type: iPhone or iPad
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        // tableta
        [self configureForPad];
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
        return YES;
}
// iPad cfg
-(void)configureForPad{
    
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    splitViewController.delegate = (id)navigationController.topViewController;

    // 1. import and Init] alloc Model
    ACCStarWarsUniverse *swuModel = [[ACCStarWarsUniverse alloc]init];
    
    // 2. import and Create StarWarsUniverseController and insert swuModel
    ACCStarWarsUTableViewController *swuTableVC = [[ACCStarWarsUTableViewController alloc]initWithModel:swuModel
                                                                                                  style:UITableViewStylePlain];
    // 3. Create StarWarsCharacterViewController with .xib for imperial and rebel, this controller will show the characters
    
    ACCStarWarsCharacterViewController *charVC = [[ACCStarWarsCharacterViewController alloc]initWithModel:[swuTableVC lastCharacterSelected]]; // call method
    /*
     4.1 combinator
     Init a navigation controller for tableView Characters on the left in memory      */
    
    UINavigationController *tableNav = [[UINavigationController alloc]init];
    tableNav.viewControllers=@[swuTableVC];
   
    // 4.2 combinator 2: Init another controller in memory, right side (delegate) CharacterViewController
    UINavigationController *charNav = [[UINavigationController alloc] init];
    charNav.viewControllers=@[charVC];

    // 5. Init SplitViewController: tableNav on the left, character on the right side
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    [splitVC setViewControllers:@[tableNav, charNav]]; //set VC to split
    
    // Who is the delegate?
    splitVC.delegate = charVC;
    swuTableVC.delegate = charVC;
   
    // 7. assigning SplitViewController as a root and load the window
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
