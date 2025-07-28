#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCLaunchItem : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *programPath;
@property (nonatomic, assign) BOOL runAtLoad;

@end

NS_ASSUME_NONNULL_END 