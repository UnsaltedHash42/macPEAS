#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCLaunchItem : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *program;
@property (nonatomic, copy) NSArray<NSString *> *programArguments;
@property (nonatomic, assign) BOOL runAtLoad;
@property (nonatomic, copy) NSString *path;

@end

NS_ASSUME_NONNULL_END 