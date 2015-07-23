#import "SEGIntegrationsRegistry.h"

static NSMutableDictionary *__registeredIntegrations = nil;

@implementation SEGIntegrationsRegistry

+ (void)registerIntegration:(Class)integrationClass withKey:(NSString *)key {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    __registeredIntegrations = [[NSMutableDictionary alloc] init];
  });

  __registeredIntegrations[key] = integrationClass;
}

+ (NSMutableDictionary *)registeredIntegrations {
  return [__registeredIntegrations copy];
}

@end