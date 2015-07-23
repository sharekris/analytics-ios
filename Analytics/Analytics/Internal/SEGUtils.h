#import <Foundation/Foundation.h>

@interface SEGUtils : NSObject

/** Assert that the given string is neither nil or empty. */
+ (NSString *)assertNotNilOrEmpty:(NSString *)string;

@end