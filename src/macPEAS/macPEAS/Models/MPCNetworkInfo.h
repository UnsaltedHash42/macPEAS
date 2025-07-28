#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCNetworkInfo : NSObject

@property (nonatomic, copy) NSString *interfaceName;
@property (nonatomic, copy) NSString *macAddress;
@property (nonatomic, copy) NSString *ipAddress;
@property (nonatomic, copy) NSString *netmask;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSArray<NSString *> *openPorts;

@end

NS_ASSUME_NONNULL_END 