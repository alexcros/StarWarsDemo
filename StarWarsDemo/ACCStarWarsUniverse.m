//
//  ACCStarWarsUniverse.m
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCStarWarsUniverse.h"

@interface ACCStarWarsUniverse ()

@property (nonatomic, strong) NSArray *rebels;
@property (nonatomic, strong) NSArray *imperials;

@end

@implementation ACCStarWarsUniverse

#pragma mark -  properties
-(NSUInteger) rebelCount{//contamos
    
    return [self.rebels count];
}

-(NSUInteger) imperialCount{
    return [self.imperials count];
}

-(ACCStarWarsCharacter *) rebelCharacterAtIndex:(NSUInteger) index{//colocamos
    
   return [self.rebels objectAtIndex:index];
}
-(ACCStarWarsCharacter *) imperialCharacterAtIndex:(NSUInteger) index{
    return [self.imperials objectAtIndex:index];
}

#pragma mark - Init
-(id) init{
    
    if (self = [super init]) {
        // Creamos los personajes
        NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSURL *soundURL = [bundle URLForResource:@"vader"
                                   withExtension:@"caf"];
        NSData *vaderSound = [NSData dataWithContentsOfURL:soundURL];
        UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
        
        ACCStarWarsCharacter *vader = [ACCStarWarsCharacter
                                       starWarsCharacterWithName:@"Anakin Skywalker"
                                       alias:@"Darth Vader"
                                       wikiPage:vaderURL
                                       image:vaderImage
                                       soundData:vaderSound];
        
        NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        
        
        NSURL *c3poSoundURL = [bundle URLForResource:@"c3po"
                                       withExtension:@"caf"];
        NSData *c3poSound = [NSData dataWithContentsOfURL:c3poSoundURL];
        UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
        
        ACCStarWarsCharacter *c3po = [ACCStarWarsCharacter
                                      starWarsCharacterWithAlias:@"C-3PO"
                                      wikiPage:c3poURL
                                      image:c3poImage
                                      soundData:c3poSound];
        
        NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/R2-D2"];
        
        
        NSURL *r2d2SoundURL = [bundle URLForResource:@"r2-d2"
                                       withExtension:@"caf"];
        NSData *r2d2Sound = [NSData dataWithContentsOfURL:r2d2SoundURL];
        UIImage *r2d2Image = [UIImage imageNamed:@"R2-D2.jpg"];
        
        ACCStarWarsCharacter *r2d2 = [ACCStarWarsCharacter
                                      starWarsCharacterWithAlias:@"R2-D2"
                                      wikiPage:r2d2URL
                                      image:r2d2Image
                                      soundData:r2d2Sound];
        
        
        
        NSURL *chewieURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        
        
        NSURL *chewieSoundURL = [bundle URLForResource:@"chewbacca"
                                         withExtension:@"caf"];
        NSData *chewieSound = [NSData dataWithContentsOfURL:chewieSoundURL];
        UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
        
        ACCStarWarsCharacter *chewie = [ACCStarWarsCharacter
                                        starWarsCharacterWithAlias:@"Chewbacca"
                                        wikiPage:chewieURL
                                        image:chewieImage
                                        soundData:chewieSound];
        
        
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        
        
        NSURL *yodaSoundURL = [bundle URLForResource:@"yoda"
                                       withExtension:@"caf"];
        NSData *yodaSound = [NSData dataWithContentsOfURL:yodaSoundURL];
        UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
        
        ACCStarWarsCharacter *yoda = [ACCStarWarsCharacter starWarsCharacterWithName:@"Minch Yoda" alias:@"Master Yoda" wikiPage:yodaURL image:yodaImage soundData:yodaSound];
        
        
        
        NSURL *palpatineURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Palpatine"];
        
        
        NSURL *palpatineSoundURL = [bundle URLForResource:@"palpatine"
                                            withExtension:@"caf"];
        NSData *palpatineSound = [NSData dataWithContentsOfURL:palpatineSoundURL];
        UIImage *palpatineImage = [UIImage imageNamed:@"palpatine.jpg"];
        
        ACCStarWarsCharacter *palpatine = [ACCStarWarsCharacter starWarsCharacterWithName:@"Palpatine" alias:@"Darth Sidious" wikiPage:palpatineURL image:palpatineImage soundData:palpatineSound];
        
        
        NSURL *tarkinURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Grand_Moff_Tarkin"];
        
        
        NSURL *tarkinSoundURL = [bundle URLForResource:@"tarkin"
                                         withExtension:@"caf"];
        NSData *tarkinSound = [NSData dataWithContentsOfURL:tarkinSoundURL];
        UIImage *tarkinImage = [UIImage imageNamed:@"tarkin.jpg"];
        
        ACCStarWarsCharacter *tarkin = [ACCStarWarsCharacter starWarsCharacterWithName:@"Wilhuf Tarkin" alias:@"Grand Moff Tarkin" wikiPage:tarkinURL image:tarkinImage soundData:tarkinSound];
        
        self.rebels = @[chewie, yoda, c3po, r2d2];
        self.imperials = @[vader, palpatine, tarkin];
        
    }
    return self;
    
}

@end
