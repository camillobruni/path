//
//  pathAppDelegate.h
//  path
//
//  Created by Camillo Bruni on 17.09.09.
//  Copyright 2009 cxg GmbH. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>

@interface pathAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
