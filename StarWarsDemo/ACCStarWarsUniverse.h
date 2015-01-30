//
//  ACCStarWarsUniverse.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

@import Foundation;

#import "ACCStarWarsCharacter.h"

@interface ACCStarWarsUniverse : NSObject

@property (nonatomic, readonly) NSUInteger imperialCount;
@property (nonatomic, readonly) NSUInteger rebelCount;

-(ACCStarWarsCharacter *) rebelCharacterAtIndex:(NSUInteger) index;
-(ACCStarWarsCharacter *) imperialCharacterAtIndex:(NSUInteger) index;


@end
