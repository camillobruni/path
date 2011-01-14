//
//  pathAppDelegate.m
//  path
//
//  Created by Camillo Bruni on 17.09.09.
//  Copyright 2009 cxg GmbH. All rights reserved.
//

#import "pathAppDelegate.h"

@implementation pathAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSOpenPanel* op = [NSOpenPanel openPanel];
	
	[op setCanChooseDirectories:YES];
	[op setCanChooseFiles:YES];
	[op setAllowsMultipleSelection:YES];
    
	[op setTitle:@"Select audio files to burn"];
	[op setPrompt:@"Select"];
	
	if ([op runModal] == NSOKButton)
		CFShow([op filename]);
}

@end
