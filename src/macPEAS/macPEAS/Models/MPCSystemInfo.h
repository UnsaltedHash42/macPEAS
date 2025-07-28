#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCSystemInfo : NSObject

@property (nonatomic, copy) NSString *osVersion;
@property (nonatomic, copy) NSString *kernelInfo;
@property (nonatomic, copy) NSString *hostname;
@property (nonatomic, copy) NSString *uptime;
@property (nonatomic, copy) NSString *csrutilStatus;
@property (nonatomic, copy) NSString *spctlStatus;
@property (nonatomic, copy) NSString *installHistory;

@end

NS_ASSUME_NONNULL_END 