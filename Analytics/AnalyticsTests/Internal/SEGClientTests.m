#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SEGClient.h"

@interface SEGClientTests : XCTestCase

@property(nonatomic, copy, readonly) SEGClient *client;

@end

@implementation SEGClientTests

- (void)setUp {
  [super setUp];

  _client = [SEGClient clientWithWriteKey:@"MlTmISmburwl2nN9o3NFpGfElujcfb0q"];
}

- (void)testSettings {
  NSDictionary *settings = [_client settings];

  // TODO: mock network response
  XCTAssertEqual(2, settings.count);
  XCTAssert(settings[@"plan"][@"track"]);
  XCTAssert(settings[@"integrations"]);
}

@end