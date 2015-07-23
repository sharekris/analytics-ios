#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "SEGAnalytics.h"
#import "SEGIntegration.h"
#import "SEGExecutor.h"
#import "SEGSynchronousExecutor.h"
#import "SEGClient.h"

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

@interface SEGAnalytics (Test)

@property(nonatomic, copy) NSDictionary *integrations;

- (instancetype)initWithWriteKey:(NSString *)writeKey
                      withClient:(SEGClient *)client
                    withExecutor:(id<SEGExecutor>)executor;

@end

@interface SEGAnalyticsTests : XCTestCase

@property(nonatomic, copy, readonly) SEGAnalytics *analytics;
@property(nonatomic, assign) id<SEGIntegration> mockIntegration;

@end

@implementation SEGAnalyticsTests

- (void)setUp {
  [super setUp];

  NSString *writeKey = @"MlTmISmburwl2nN9o3NFpGfElujcfb0q";
  SEGSynchronousExecutor *executor = [SEGSynchronousExecutor executor];
  SEGClient *client = [SEGClient clientWithWriteKey:writeKey]; // todo: use fake

  _analytics = [[SEGAnalytics alloc] initWithWriteKey:writeKey
                                           withClient:client
                                         withExecutor:executor];

  _mockIntegration = mockProtocol(@protocol(SEGIntegration));
  _analytics.integrations = @{ @"mock" : _mockIntegration };
}

- (void)testTrack {
  [_analytics track:@"bar" properties:@{} options:@{}];

  [verify(_mockIntegration) track:@"bar" properties:@{}];
}

@end