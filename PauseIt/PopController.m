//
//  PopController.m
//  PauseIt
//
//  Created by Matthew Riley on 2016-09-10.
//  Copyright © 2016 Matthew Riley. All rights reserved.
//

#import "PopController.h"
@import AppKit;

@interface PopController () <NSSpeechRecognizerDelegate> {
    BOOL isOn;
    NSString* userName;
    NSSpeechRecognizer* recog;
    NSString* stopSpotifyScript;
    NSString* stopAppleScript;
    NSString* currentScript;
}

@end

@implementation PopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toggleBtn.action = @selector(toggleActive);
    self.toggleBtn.target = self;
    
    self.spotifyBtn.action = @selector(selectSpotify);
    self.spotifyBtn.target = self;
    
    self.appleBtn.action = @selector(selectApple);
    self.appleBtn.target = self;
    
    // setup recognizer
    recog = [[NSSpeechRecognizer alloc] init];
    [recog setDelegate:self];
    [recog setListensInForegroundOnly:NO];
    [recog setBlocksOtherRecognizers:YES];
    //NSString* placeholder = self.nameTextField.placeholderString;
    NSArray* arr = @[@"Max"];
    [recog setCommands:arr];
    
    // set the strings
    stopSpotifyScript = @"tell application \"iTunes\" to pause";
    stopSpotifyScript = @"tell application \"Spotify\" to pause";
    
    // TODO: load defaults
    // for now, start with ON and Spotify
    isOn = YES;
    [self turnOn];
    [self selectSpotify];
}

-(void) selectSpotify {
    self.spotifyBtn.alphaValue = 1.0f;
    self.appleBtn.alphaValue = 0.25f;
    currentScript = stopSpotifyScript;
}

-(void) selectApple {
    self.spotifyBtn.alphaValue = 0.25f;
    self.appleBtn.alphaValue = 1.0f;
    currentScript = stopAppleScript;
}

-(void) toggleActive {
    if (isOn) {
        isOn = NO;
        self.toggleBtn.title = @"Turn Off";
        [self turnOn];
    } else {
        isOn = YES;
        // TODO stop listening
        self.toggleBtn.title = @"Turn On";
        [self turnOff];
    }
}

-(void) turnOn {
    NSLog(@"start listening");
    [recog startListening];
}

-(void) turnOff {
    NSLog(@"stop listening");
    [recog stopListening];
}

- (IBAction) nameChanged:(id)sender {
    NSLog(@"changed name");
    userName = self.nameTextField.stringValue;
    NSArray* hotwords = @[userName];
    [recog setCommands:hotwords];
}

-(void) speechRecognizer:(NSSpeechRecognizer *)sender didRecognizeCommand:(NSString *)command {
    NSLog(@"recognized word!");
    
    // execute script cmd
    NSAppleScript* script = [[NSAppleScript alloc] initWithSource:currentScript];
    [script executeAndReturnError:nil];
}

@end
