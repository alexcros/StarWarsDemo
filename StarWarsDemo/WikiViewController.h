//
//  WikiViewController.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 31/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACCStarWarsUniverse.h"

@interface WikiViewController : UIViewController <UIWebViewDelegate>

@property (strong,nonatomic) ACCStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel:(ACCStarWarsCharacter*) model;

@end
