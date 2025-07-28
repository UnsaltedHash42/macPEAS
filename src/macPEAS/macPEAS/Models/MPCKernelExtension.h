#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCKernelExtension : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *bundleIdentifier;
@property (nonatomic, assign) BOOL isThirdParty;

@end

NS_ASSUME_NONNULL_END 