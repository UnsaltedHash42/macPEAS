#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCSystemInfo : NSObject

@property (nonatomic, copy) NSString *osVersion;
@property (nonatomic, copy) NSString *kernelVersion;
@property (nonatomic, copy) NSString *hostname;
@property (nonatomic, copy) NSString *uptime;
@property (nonatomic, copy) NSString *cpuInfo;
@property (nonatomic, copy) NSString *sipStatus;
@property (nonatomic, copy) NSString *gatekeeperStatus;
@property (nonatomic, copy) NSString *xprotectVersion;

@end

NS_ASSUME_NONNULL_END 