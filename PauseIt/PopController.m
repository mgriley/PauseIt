//
//  PopController.m
//  PauseIt
//
//  Created by Matthew Riley on 2016-09-10.
//  Copyright © 2016 Matthew Riley. All rights reserved.
//

#import "PopController.h"

@interface PopController () {
    BOOL isOn;
    NSString* userName;
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
    
    isOn = YES;
    [self selectSpotify];
}

-(void) selectSpotify {
    self.spotifyBtn.alphaValue = 1.0f;
    self.appleBtn.alphaValue = 0.25f;
}

-(void) selectApple {
    self.spotifyBtn.alphaValue = 0.25f;
    self.appleBtn.alphaValue = 1.0f;
}

-(void) toggleActive {
    if (isOn) {
        isOn = NO;
        // TODO
        self.toggleBtn.title = @"Turn Off";
    } else {
        isOn = YES;
        // TODO
        self.toggleBtn.title = @"Turn On";
    }
}

- (IBAction) nameChanged:(id)sender {
    userName = self.nameTextField.stringValue;
    // TODO
}

@end
