//
//  NSObject+newListener.h
//  PauseSpeechRecognition
//
//  Created by Andrew Wang on 9/10/16.
//  Copyright © 2016 Andrew Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AppKit;

@interface NSSpeechRecognizer (newListener)
-(void)addHotWord:(NSString*) newHotWord;
-(void)newCommand: (NSString*) newHotWord;
@end
