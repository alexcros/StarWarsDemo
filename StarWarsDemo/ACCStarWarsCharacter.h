//
//  ACCStarWarsCharacter.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface ACCStarWarsCharacter : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *alias;
@property (strong, nonatomic) NSURL *wikiPage;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSData *soundData;


// Class methods
+(instancetype) starWarsCharacterWithName:(NSString *)name
                                    alias:(NSString*) alias
                                 wikiPage:(NSURL*) url
                                    image:(UIImage*) photo
                                soundData:(NSData*) soundData;

+(instancetype) starWarsCharacterWithAlias:(NSString*) alias
                                  wikiPage:(NSURL*) url
                                     image:(UIImage*) photo
                                 soundData:(NSData*) soundData;
// designated

-(id) initWithName:(NSString *)name
             alias:(NSString*) alias
          wikiPage:(NSURL*) url
             image:(UIImage*) photo
         soundData:(NSData*) soundData;

// convenience
-(id) initWithAlias:(NSString*) alias
           wikiPage:(NSURL*) url
              image:(UIImage*) photo
          soundData:(NSData*) soundData;
@end
