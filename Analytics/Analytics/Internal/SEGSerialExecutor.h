#import <Foundation/Foundation.h>
#import "SEGExecutor.h"

@interface SEGSerialExecutor : NSObject <SEGExecutor>

+ (instancetype)executorWithName:(NSString *)name;

@property(nonatomic, readonly) dispatch_queue_t dispatcher;

@end