#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCApplication : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *bundleIdentifier;

@end

NS_ASSUME_NONNULL_END 