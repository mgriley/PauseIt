//
//  PopController.h
//  PauseIt
//
//  Created by Matthew Riley on 2016-09-10.
//  Copyright © 2016 Matthew Riley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PopController : NSViewController

@property (weak) IBOutlet NSButton *toggleBtn;
@property (weak) IBOutlet NSButton *spotifyBtn;
@property (weak) IBOutlet NSButton *appleBtn;
@property (weak) IBOutlet NSTextField *nameTextField;
- (IBAction)nameChanged:(id)sender;

@end
