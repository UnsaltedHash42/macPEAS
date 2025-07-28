#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCGroup : NSObject

@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, copy) NSString *gid;
@property (nonatomic, copy) NSArray<NSString *> *members;

@end

NS_ASSUME_NONNULL_END 