//
//  WikiViewController.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 31/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "WikiViewController.h"

/* no used
@interface WikiViewController ()

@end
*/

@implementation WikiViewController

-(id)initWithModel:(ACCStarWarsCharacter*) model {
    
    if (self = [super initWithNibName:nil
                               bundle:nil]){
        
        _model = model;
        self.title = @"Wikipedia";
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

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    // decirle al activityview que pare
    [self.activityView stopAnimating];// self.activitiView va a la propiedad de la clase
    self.activityView.hidden = YES;
    
    
}

-(BOOL) webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) ||
        (navigationType == UIWebViewNavigationTypeFormSubmitted)) {
        // ni de coña
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - Utils
-(void) syncViewWithModel{
    
    // Mostar el activity
    self.activityView.hidden = NO;
    
    // empezar la animación
    [self.activityView startAnimating];
    
    // cargar la url
    NSURLRequest *r = [NSURLRequest
                       requestWithURL:self.model.wikiPage];
    [self.browser loadRequest:r];
    
    
}

@end
