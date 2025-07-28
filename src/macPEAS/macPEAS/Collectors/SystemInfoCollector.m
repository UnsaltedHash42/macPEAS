#import "SystemInfoCollector.h"
#import "TaskRunner.h"

@implementation SystemInfoCollector

- (MPCSystemInfo *)collectSystemInfo {
    MPCSystemInfo *systemInfo = [[MPCSystemInfo alloc] init];
    
    systemInfo.osVersion = [self runCommand:@"/usr/bin/sw_vers" withArguments:@[@"-productVersion"]];
    systemInfo.kernelVersion = [self runCommand:@"/usr/bin/uname" withArguments:@[@"-v"]];
    systemInfo.hostname = [self runCommand:@"/bin/hostname" withArguments:@[]];
    systemInfo.uptime = [self runCommand:@"/usr/bin/uptime" withArguments:@[]];
    systemInfo.cpuInfo = [self runCommand:@"/usr/sbin/sysctl" withArguments:@[@"-n", @"machdep.cpu.brand_string"]];
    systemInfo.sipStatus = [self runCommand:@"/usr/bin/csrutil" withArguments:@[@"status"]];
    systemInfo.gatekeeperStatus = [self runCommand:@"/usr/sbin/spctl" withArguments:@[@"--status"]];
    systemInfo.xprotectVersion = @"Not implemented"; // Placeholder

    return systemInfo;
}

- (NSString *)runCommand:(NSString *)command withArguments:(NSArray<NSString *> *)arguments {
    NSString *output = [TaskRunner runCommand:command withArguments:arguments];
    return [output stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end 