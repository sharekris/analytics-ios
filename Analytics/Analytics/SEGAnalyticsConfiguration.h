#import <Foundation/Foundation.h>

@interface SEGAnalyticsConfiguration : NSObject

/**
 * Creates and returns a configuration with default settings and the given
 * Segment writeKey.
 *
 * @param writeKey Your Segment project writeKey.
 */
+ (instancetype)configurationWithWriteKey:(NSString *)writeKey;

/** Your Segment project writeKey. */
@property(nonatomic, copy, readonly) NSString *writeKey;

@end