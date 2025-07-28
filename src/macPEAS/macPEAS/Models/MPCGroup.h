#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCGroup : NSObject

@property (nonatomic, copy) NSString *groupname;
@property (nonatomic, copy) NSString *gid;
@property (nonatomic, strong) NSArray<NSString *> *members;

@end

NS_ASSUME_NONNULL_END 