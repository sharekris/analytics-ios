#import <Foundation/Foundation.h>
#import "SEGIntegration.h"
#import <Mixpanel/Mixpanel.h>

@interface SEGMixpanelIntegration : NSObject <SEGIntegration>

@property(nonatomic, readwrite) Mixpanel *mixpanel;

@end