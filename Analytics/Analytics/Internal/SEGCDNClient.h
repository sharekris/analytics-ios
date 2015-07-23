#import <Foundation/Foundation.h>

@interface SEGCDNClient : NSObject

+ (instancetype)clientWithWriteKey:(NSString *)writeKey;

@property(nonatomic, readonly) NSString *writeKey;

- (NSDictionary *)settings;

@end