//
//  ACCStarWarsCharacter.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCStarWarsCharacter.h"

@implementation ACCStarWarsCharacter

+(instancetype) starWarsCharacterWithName:(NSString *)name
                                    alias:(NSString*) alias
                                 wikiPage:(NSURL*) url
                                    image:(UIImage*) photo
                                soundData:(NSData*) soundData{
    
    return [[self alloc] initWithName:name
                                alias:alias
                             wikiPage:url
                                image:photo
                            soundData:soundData];
}

+(instancetype) starWarsCharacterWithAlias:(NSString*) alias
                                  wikiPage:(NSURL*) url
                                     image:(UIImage*) photo
                                 soundData:(NSData*) soundData{
    
    return [[self alloc] initWithAlias:alias
                              wikiPage:url
                                 image:photo
                             soundData:soundData];
}

// designated
-(id) initWithName:(NSString *)name
             alias:(NSString*) alias
          wikiPage:(NSURL*) url
             image:(UIImage*) photo
         soundData:(NSData*) soundData{
    
    if (self = [super init]) {
        _name = name;
        _alias = alias;
        _wikiPage = url;
        _photo = photo;
        _soundData = soundData;
    }
    return self;
    
}


-(id) initWithAlias:(NSString*) alias
           wikiPage:(NSURL*) url
              image:(UIImage*) photo
          soundData:(NSData*) soundData{
    
    return [self initWithName:nil
                        alias:alias
                     wikiPage:url
                        image:photo
                    soundData:soundData];
}
@end
