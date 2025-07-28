#import <XCTest/XCTest.h>
#import "SystemInfoCollector.h"
#import "MPCSystemInfo.h"
#import "TaskRunner.h"
#import <objc/runtime.h>

@interface SystemInfoCollectorTests : XCTestCase
@property (nonatomic, strong) SystemInfoCollector *collector;
@end

// A static variable to hold the mock results for our swizzled method.
static NSMutableDictionary<NSString *, NSString *> *mockResults;

@implementation SystemInfoCollectorTests

// Our mock implementation for TaskRunner's runCommand:withArguments:
+ (NSString *)mock_runCommand:(NSString *)command withArguments:(NSArray<NSString *> *)arguments {
    // Create a unique key for each command + arguments combination.
    NSString *key = command;
    if (arguments && arguments.count > 0) {
        key = [NSString stringWithFormat:@"%@ %@", command, [arguments componentsJoinedByString:@" "]];
    }
    
    // In case there are extra spaces in arguments in the collector
    key = [key stringByReplacingOccurrencesOfString:@"  " withString:@" "];
    
    return mockResults[key];
}

+ (void)setUp {
    [super setUp];
    // This is a class-level setup. It runs once before any tests in the class.
    // We swizzle the method here.
    Method originalMethod = class_getClassMethod([TaskRunner class], @selector(runCommand:withArguments:));
    Method swizzledMethod = class_getClassMethod([self class], @selector(mock_runCommand:withArguments:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
    mockResults = [NSMutableDictionary dictionary];
}

+ (void)tearDown {
    // This is a class-level teardown. It runs once after all tests in the class have finished.
    // We swizzle back to the original implementation to not affect other tests.
    Method originalMethod = class_getClassMethod([TaskRunner class], @selector(runCommand:withArguments:));
    Method swizzledMethod = class_getClassMethod([self class], @selector(mock_runCommand:withArguments:));
    method_exchangeImplementations(swizzledMethod, originalMethod);
    mockResults = nil;
    [super tearDown];
}

- (void)setUp {
    [super setUp];
    // This is an instance-level setup. It runs before each test method.
    self.collector = [[SystemInfoCollector alloc] init];
    // Clear out mock results before each test to ensure a clean state.
    [mockResults removeAllObjects];
}

- (void)tearDown {
    // This is an instance-level teardown. It runs after each test method.
    self.collector = nil;
    [super tearDown];
}

- (void)testSuccessfulSystemInfoCollection {
    // Arrange
    // Populate our mock dictionary with expected outputs for each command.
    // The keys are constructed to match how they would be called in the collector.
    mockResults[@"/usr/bin/sw_vers -productVersion"] = @"12.3.1\n";
    mockResults[@"/usr/bin/uname -v"] = @"Darwin Kernel Version 21.4.0\n";
    mockResults[@"/bin/hostname"] = @"test-host.local\n";
    mockResults[@"/usr/bin/uptime"] = @"12:34 up 5 days, 2:11, 2 users, load average: 1.00, 1.01, 1.02\n";
    mockResults[@"/usr/sbin/sysctl -n machdep.cpu.brand_string"] = @"Test CPU @ 3.00GHz\n";
    mockResults[@"/usr/bin/csrutil status"] = @"System Integrity Protection status: enabled.\n";
    mockResults[@"/usr/sbin/spctl --status"] = @"assessments enabled\n";
    
    // Act
    MPCSystemInfo *systemInfo = [self.collector collectSystemInfo];
    
    // Assert
    // Verify that each property of the returned MPCSystemInfo object is correctly populated.
    XCTAssertNotNil(systemInfo, @"The collected system info should not be nil.");
    XCTAssertEqualObjects(systemInfo.osVersion, @"12.3.1");
    XCTAssertEqualObjects(systemInfo.kernelVersion, @"Darwin Kernel Version 21.4.0");
    XCTAssertEqualObjects(systemInfo.hostname, @"test-host.local");
    XCTAssertEqualObjects(systemInfo.uptime, @"12:34 up 5 days, 2:11, 2 users, load average: 1.00, 1.01, 1.02");
    XCTAssertEqualObjects(systemInfo.cpuInfo, @"Test CPU @ 3.00GHz");
    XCTAssertEqualObjects(systemInfo.sipStatus, @"System Integrity Protection status: enabled.");
    XCTAssertEqualObjects(systemInfo.gatekeeperStatus, @"assessments enabled");
    // xprotectVersion is hardcoded to "Not implemented" for now.
    XCTAssertEqualObjects(systemInfo.xprotectVersion, @"Not implemented");
}

- (void)testHandlingOfCommandFailures {
    // Arrange
    // We only provide a result for one command. Others will return nil from our mock.
    mockResults[@"/usr/bin/sw_vers -productVersion"] = @"12.3.1\n";
    
    // Act
    MPCSystemInfo *systemInfo = [self.collector collectSystemInfo];
    
    // Assert
    // Verify that properties are nil when their corresponding commands "fail" (return nil).
    XCTAssertNotNil(systemInfo, @"The collected system info should not be nil.");
    XCTAssertEqualObjects(systemInfo.osVersion, @"12.3.1");
    XCTAssertNil(systemInfo.kernelVersion, @"Kernel version should be nil if the command fails.");
    XCTAssertNil(systemInfo.hostname, @"Hostname should be nil if the command fails.");
    XCTAssertNil(systemInfo.uptime, @"Uptime should be nil if the command fails.");
    XCTAssertNil(systemInfo.cpuInfo, @"CPU info should be nil if the command fails.");
    XCTAssertNil(systemInfo.sipStatus, @"SIP status should be nil if the command fails.");
    XCTAssertNil(systemInfo.gatekeeperStatus, @"Gatekeeper status should be nil if the command fails.");
}

- (void)testParsingOfDifferentSystemResponses {
    // Arrange
    // Test that leading/trailing whitespace and newlines are correctly trimmed.
    mockResults[@"/usr/bin/sw_vers -productVersion"] = @"   12.3.1   ";
    mockResults[@"/bin/hostname"] = @"test-host.local\n\n";
    
    // Act
    MPCSystemInfo *systemInfo = [self.collector collectSystemInfo];
    
    // Assert
    XCTAssertEqualObjects(systemInfo.osVersion, @"12.3.1", @"Should correctly trim whitespace.");
    XCTAssertEqualObjects(systemInfo.hostname, @"test-host.local", @"Should correctly trim newlines.");
}

@end 