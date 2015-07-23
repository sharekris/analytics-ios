#import "SEGSerialExecutor.h"
#import "SEGExecutor.h"

@implementation SEGSerialExecutor

+ (instancetype)executorWithName:(NSString *)name {
  const char *label =
      [[@"SegmentAnalytics-" stringByAppendingString:name] UTF8String];
  return [[SEGSerialExecutor alloc]
      initWithDispatcher:dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL)];
}

- (instancetype)initWithDispatcher:(dispatch_queue_t)dispatcher {
  self = [super init];
  if (self) {
    _dispatcher = dispatcher;
  }
  return self;
}

- (void)submit:(void (^)())block {
  dispatch_async(_dispatcher, block);
}

@end