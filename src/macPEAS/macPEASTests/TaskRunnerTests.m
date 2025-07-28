#import <XCTest/XCTest.h>
#import "TaskRunner.h"

@interface TaskRunnerTests : XCTestCase

@end

@implementation TaskRunnerTests

- (void)testRunCommand_validCommand_returnsOutput {
    // Arrange
    NSString *command = @"/bin/echo";
    NSArray<NSString *> *arguments = @[@"hello"];
    
    // Act
    NSString *output = [TaskRunner runCommand:command withArguments:arguments];
    
    // Assert
    XCTAssertNotNil(output);
    XCTAssertEqualObjects([output stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]], @"hello");
}

- (void)testRunCommand_invalidCommand_returnsNil {
    // Arrange
    NSString *command = @"/invalid/command";
    NSArray<NSString *> *arguments = @[];
    
    // Act
    NSString *output = [TaskRunner runCommand:command withArguments:arguments];
    
    // Assert
    XCTAssertNil(output);
}

- (void)testRunCommand_commandWithArguments_returnsOutput {
    // Arrange
    NSString *command = @"/usr/bin/grep";
    // Create a temporary file with some content
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"test.txt"];
    [@"hello\nworld\n" writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSArray<NSString *> *arguments = @[@"hello", filePath];
    
    // Act
    NSString *output = [TaskRunner runCommand:command withArguments:arguments];
    
    // Assert
    XCTAssertNotNil(output);
    XCTAssertEqualObjects([output stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]], @"hello");
    
    // Clean up
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

@end 