#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCFileSystemItem : NSObject

@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *permissions;
@property (nonatomic, copy) NSString *owner;
@property (nonatomic, copy) NSString *group;
@property (nonatomic, assign) BOOL isSUID;
@property (nonatomic, assign) BOOL isSGID;
@property (nonatomic, assign) BOOL isWorldWritable;

@end

NS_ASSUME_NONNULL_END 