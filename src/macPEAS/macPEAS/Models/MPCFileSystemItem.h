#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCFileSystemItem : NSObject

@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *permissions;
@property (nonatomic, copy) NSString *owner;

@end

NS_ASSUME_NONNULL_END 