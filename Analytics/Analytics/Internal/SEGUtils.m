#import "SEGUtils.h"

@implementation SEGUtils

+ (NSString *)assertNotNilOrEmpty:(NSString *)string {
  NSParameterAssert(string != nil && string.length != 0);
  NSString *trimmed =
      [string stringByTrimmingCharactersInSet:
                  [NSCharacterSet whitespaceAndNewlineCharacterSet]];
  NSParameterAssert(trimmed.length != 0);
  return string;
}

@end