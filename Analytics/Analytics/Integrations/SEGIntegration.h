#import <Foundation/Foundation.h>
#import "SEGAnalyticsConfiguration.h"

/** Protocol for all bundled integrations. */
@protocol SEGIntegration <NSObject>

- (id)initWithSettings:(NSDictionary *)settings;

@optional
- (void)track:(NSString *)event properties:(NSDictionary *)properties;

@end