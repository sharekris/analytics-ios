#import "SEGMixpanelIntegration.h"
#import "SEGIntegrationsRegistry.h"

@implementation SEGMixpanelIntegration

+ (void)load {
  [SEGIntegrationsRegistry registerIntegration:self withKey:@"Mixpanel"];
}

- (id)initWithSettings:(NSDictionary *)settings {
  self = [super init];
  if (self) {
    NSString *token = settings[@"token"];
    _mixpanel = [Mixpanel sharedInstanceWithToken:token];
  }
  return self;
}

- (void)track:(NSString *)event properties:(NSDictionary *)properties {
  [_mixpanel track:event properties:properties];
}

@end