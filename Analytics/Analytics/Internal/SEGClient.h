#import <Foundation/Foundation.h>

@interface SEGClient : NSObject

+ (instancetype)clientWithWriteKey:(NSString *)writeKey;

@property(nonatomic, readonly) NSString *writeKey;

- (NSDictionary *)settings;

@end