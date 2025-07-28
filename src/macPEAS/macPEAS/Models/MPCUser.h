#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCUser : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *gid;
@property (nonatomic, copy) NSString *homeDirectory;
@property (nonatomic, copy) NSString *shell;
@property (nonatomic, copy) NSString *lastLogin;
@property (nonatomic, copy) NSString *passwordPolicy;

@end

NS_ASSUME_NONNULL_END 