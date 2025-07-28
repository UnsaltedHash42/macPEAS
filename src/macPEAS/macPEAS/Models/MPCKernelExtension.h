#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCKernelExtension : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *bundleID;

@end

NS_ASSUME_NONNULL_END 