#import <Foundation/Foundation.h>

#if __has_include("SEGSegmentMixpanelIntegration.h")
#import "SEGSegmentMixpanelIntegration.h"
#endif

@interface SEGIntegrationsRegistry : NSObject

/** Register an interation provider with the Analytics library. */
+ (void)registerIntegration:(Class)integrationClass withKey:(NSString *)key;

/** Return an array of all registered integrations. */
+ (NSMutableDictionary *)registeredIntegrations;

@end