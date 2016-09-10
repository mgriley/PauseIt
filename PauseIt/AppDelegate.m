//
//  AppDelegate.m
//  Pause
//
//  Created by Matthew Riley on 2016-09-09.
//  Copyright © 2016 Matthew Riley. All rights reserved.
//

#import "AppDelegate.h"
#import "PopController.h"

@interface AppDelegate () {
    NSStatusItem* statusItem;
    PopController* popViewController;
    NSPopover* popover;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // setup the status item
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    statusItem.button.title = @"Pause";
    statusItem.button.action = @selector(showPopup);
    statusItem.button.target = self;
    
    // setup popover
    popViewController = [[PopController alloc] initWithNibName:@"PopController" bundle:nil];
    popover = [[NSPopover alloc] init];
    popover.contentViewController = popViewController;
    popover.behavior = NSPopoverBehaviorTransient; // dismiss when click outside of the popover
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void) showPopup {
    [popover showRelativeToRect:NSZeroRect ofView:statusItem.button preferredEdge:NSMinYEdge];
}

@end
