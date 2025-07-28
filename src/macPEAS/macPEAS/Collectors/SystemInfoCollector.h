#import <Foundation/Foundation.h>
#import "MPCSystemInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface SystemInfoCollector : NSObject

- (MPCSystemInfo *)collectSystemInfo;

@end

NS_ASSUME_NONNULL_END 