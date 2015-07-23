#import "SEGAnalytics.h"
#import "SEGIntegrationsRegistry.h"
#import "SEGIntegration.h"
#import "SEGCDNClient.h"
#import "SEGExecutor.h"
#import "SEGSerialExecutor.h"
#import "SEGSerialExecutor.h"
#import "SEGLog.h"

@interface SEGAnalytics ()

@property(nonatomic, readonly) NSString *writeKey;
@property(nonatomic, readonly) SEGCDNClient *cdn;
@property(nonatomic, readonly) id<SEGExecutor> executor;
@property(nonatomic, copy) NSDictionary *integrations; // readwrite for testing

@end

@implementation SEGAnalytics

+ (instancetype)createWithConfiguration:
    (SEGAnalyticsConfiguration *)configuration {
  SEGCDNClient *cdn = [SEGCDNClient clientWithWriteKey:configuration.writeKey];
  SEGSerialExecutor *executor =
      [SEGSerialExecutor executorWithName:@"SEGAnalytics"];
  return [[SEGAnalytics alloc] initWithWriteKey:configuration.writeKey
                                     withClient:cdn
                                   withExecutor:executor];
}

- (instancetype)initWithWriteKey:(NSString *)writeKey
                      withClient:(SEGCDNClient *)cdn
                    withExecutor:(id<SEGExecutor>)executor {
  self = [super init];
  if (self) {
    _writeKey = writeKey;
    _cdn = cdn;
    _executor = executor;

    [_executor submit:^{
      NSDictionary *settings = [_cdn settings];
      [self initializeIntegrationsWithSettings:settings];
    }];
  }
  return self;
}

- (void)initializeIntegrationsWithSettings:(NSDictionary *)settings {
  SEGLog(@"Initializing integrations with settings: %@", settings);

  NSDictionary *registeredIntegrations =
      [SEGIntegrationsRegistry registeredIntegrations];
  NSMutableDictionary *initializedIntegrations =
      [NSMutableDictionary dictionaryWithCapacity:registeredIntegrations.count];
  [registeredIntegrations
      enumerateKeysAndObjectsUsingBlock:^(NSString *key, Class integrationClass,
                                          BOOL *stop) {
        NSDictionary *integrationSettings = settings[@"integrations"][key];
        SEGLog(@"Initializing integration %@ with settings: %@", key,
               integrationSettings);
        id<SEGIntegration> integration =
            [[integrationClass alloc] initWithSettings:integrationSettings];
        initializedIntegrations[key] = integration;
      }];
  _integrations = [initializedIntegrations copy];
}

- (void)track:(NSString *)event
   properties:(NSDictionary *)properties
      options:(NSDictionary *)options {
  [self enqueue:^(NSString *key, id<SEGIntegration> integration) {
    [integration track:event properties:properties];
  }];
}

- (void)enqueue:(void (^)(NSString *, id<SEGIntegration>))action {
  [_executor submit:^{
    [_integrations
        enumerateKeysAndObjectsUsingBlock:^(NSString *key,
                                            id<SEGIntegration> integration,
                                            BOOL *stop) {
          action(key, integration);
        }];
  }];
}

@end