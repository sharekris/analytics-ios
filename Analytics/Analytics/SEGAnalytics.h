#import <Foundation/Foundation.h>
#import "SEGAnalyticsConfiguration.h"

@interface SEGAnalytics : NSObject

+ (instancetype)createWithConfiguration:
    (SEGAnalyticsConfiguration *)configuration;

- (void)track:(NSString *)event
   properties:(NSDictionary *)properties
      options:(NSDictionary *)options;

@end