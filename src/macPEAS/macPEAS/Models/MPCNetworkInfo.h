#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCNetworkInfo : NSObject

@property (nonatomic, copy) NSString *interfaceName;
@property (nonatomic, copy) NSString *ipAddress;
@property (nonatomic, copy) NSString *macAddress;
@property (nonatomic, assign) BOOL isUp;

@end

NS_ASSUME_NONNULL_END 