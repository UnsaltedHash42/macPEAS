#import "TaskRunner.h"

@implementation TaskRunner

+ (NSString *)runCommand:(NSString *)command withArguments:(NSArray<NSString *> *)arguments {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:command];
    [task setArguments:arguments];

    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput:pipe];
    [task setStandardError:pipe];

    NSFileHandle *file = [pipe fileHandleForReading];

    @try {
        [task launch];
    } @catch (NSException *exception) {
        NSLog(@"Error launching task: %@", exception.reason);
        return nil;
    }

    [task waitUntilExit];

    NSData *data = [file readDataToEndOfFile];
    [file closeFile];

    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end 