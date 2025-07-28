#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskRunner : NSObject

/**
 * @brief Runs a command with specified arguments and returns the standard output.
 *
 * This method executes a command in a separate process and captures its standard output.
 * It uses NSTask to securely run the command and NSPipe to read the output.
 *
 * @param command The full path to the command to be executed.
 * @param arguments An array of string arguments to pass to the command.
 * @return A string containing the standard output of the command, or nil if an error occurs.
 */
+ (NSString *)runCommand:(NSString *)command withArguments:(NSArray<NSString *> *)arguments;

@end

NS_ASSUME_NONNULL_END 