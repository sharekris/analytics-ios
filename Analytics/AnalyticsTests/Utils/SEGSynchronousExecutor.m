#import "SEGSynchronousExecutor.h"

@implementation SEGSynchronousExecutor

+ (instancetype)executor {
  return [[SEGSynchronousExecutor alloc] init];
}

- (instancetype)init {
  self = [super init];
  if (self) {
  }
  return self;
}

- (void)submit:(void (^)())block {
  block();
}

@end