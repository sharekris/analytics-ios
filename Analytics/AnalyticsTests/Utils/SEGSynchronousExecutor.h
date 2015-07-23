#import <Foundation/Foundation.h>
#import "SEGExecutor.h"

@interface SEGSynchronousExecutor : NSObject <SEGExecutor>

+ (instancetype)executor;

@end