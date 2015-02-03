//
//  AppDelegate.h
//  StarWarsDemo
//
//  Created by Alexandre Cros on 30/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>


@interface CafPlayer : NSObject {
    
}

@property (retain) AVAudioPlayer *player;

+(id) cafPlayer;

-(void) playFile:(NSURL *) aSoundFile;
-(void) playSoundData: (NSData *) data;
@end
