//
//  NSObject+newListener.m
//  PauseSpeechRecognition
//
//  Created by Andrew Wang on 9/10/16.
//  Copyright © 2016 Andrew Wang. All rights reserved.
//

#import "NSObject+newListener.h"
@import AppKit;

@implementation NSSpeechRecognizer (newListener)
//adds a new hotword to the list of hotwords
-(void)addHotWord: (NSString*) newHotWord {
    NSArray <NSString *> *command = self.commands;
    NSArray *newWord = [NSArray arrayWithObjects:newHotWord, nil];
    self.commands = [command arrayByAddingObjectsFromArray:newWord];
}

//resets the list of hotwords to only the given value
-(void)newCommand: (NSString*) newHotWord {
    NSArray *newWord = [NSArray arrayWithObjects:newHotWord, nil];
    self.commands = newWord;
}

@end
