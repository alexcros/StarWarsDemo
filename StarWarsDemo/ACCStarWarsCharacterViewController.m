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
 
 
 -(id) initWithModel:(AGTStarWarsCharacter*)model{
 
 if (self = [super initWithNibName:nil
 bundle:nil]) {
 _model = model;
 self.title = model.alias;
 }
 return self;
 }
 
 */
#import "ACCStarWarsCharacterViewController.h"

@implementation ACCStarWarsCharacterViewController

-(id) initWithModel: (ACCStarWarsCharacter*)model{ //init ACCStarWarsChar model
    
    if(self = [super initWithNibName:nil // default
                              bundle:nil]){
        
        _model = model;
        self.title = model.alias; // set title with alias
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
