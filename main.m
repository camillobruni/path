#import <Cocoa/Cocoa.h>
#include <stdlib.h>

char * convertPath(NSString * path) 
{
    return realpath([path fileSystemRepresentation], NULL);
}

int main(int argc, char *argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSApplication * app = [NSApplication sharedApplication];

    
    NSString * dir = [[NSFileManager defaultManager] currentDirectoryPath];
    /*if (argc > 1) {
        char * realpath = realpath(argv[1], NULL);
        dir = [[NSFileManager defaultManager] stringWithFileSystemRepresentation: realpath
                                                                          length: strlen(realpath)];
    }*/
    
    NSOpenPanel* op = [NSOpenPanel openPanel];
	
	[op setCanChooseDirectories:YES];
	[op setCanChooseFiles:YES];
	[op setAllowsMultipleSelection:YES];
	[op setExtensionHidden:FALSE];
	[op setCanCreateDirectories:YES];
    
	[op setTitle:@"Select Files and Folders"];
	[op setPrompt:@"Select"];
    [op setDirectory: dir];
	
    [app requestUserAttention: NSCriticalRequest];
    [app activateIgnoringOtherApps:YES];
    
	if ([op runModal] == NSOKButton) {
        NSArray * urls = [op URLs];
        printf("%s\n", convertPath([[urls objectAtIndex:0] path]));
        for (int i=1; i<[urls count]; ++i) {
            //printf("\n");
            printf("%s\n", convertPath([[urls objectAtIndex:i] path]));
        }
    }
    
    [pool drain];
    return 0;
}


