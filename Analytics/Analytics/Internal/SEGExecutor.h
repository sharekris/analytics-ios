#import <Foundation/Foundation.h>

@protocol SEGExecutor <NSObject>

- (void)submit:(void (^)())block;

@end