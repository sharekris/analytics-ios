#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SEGCDNClient.h"

@interface SEGCDNClientTests : XCTestCase

@property(nonatomic, copy, readonly) SEGCDNClient *cdn;

@end

@implementation SEGCDNClientTests

- (void)setUp {
  [super setUp];

  _cdn = [SEGCDNClient clientWithWriteKey:@"MlTmISmburwl2nN9o3NFpGfElujcfb0q"];
}

- (void)testSettings {
  NSDictionary *settings = [_cdn settings];

  // TODO: mock network response
  XCTAssertEqual(2, settings.count);
  XCTAssert(settings[@"plan"][@"track"]);
  XCTAssert(settings[@"integrations"]);
}

@end