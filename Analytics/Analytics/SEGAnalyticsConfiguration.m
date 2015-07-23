#import "SEGAnalyticsConfiguration.h"
#import "SEGUtils.h"

@implementation SEGAnalyticsConfiguration

+ (instancetype)configurationWithWriteKey:(NSString *)writeKey {
  return [[self alloc] initWithWriteKey:writeKey];
}

- (id)initWithWriteKey:(NSString *)writeKey {
  if (self = [self init]) {
    _writeKey = [SEGUtils assertNotNilOrEmpty:writeKey];
  }
  return self;
}

@end