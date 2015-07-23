#import "SEGClient.h"

@implementation SEGClient

+ (instancetype)clientWithWriteKey:(NSString *)writeKey {
  return [[SEGClient alloc] initWithWriteKey:writeKey];
}

- (instancetype)initWithWriteKey:(NSString *)writeKey {
  self = [super init];
  if (self) {
    _writeKey = writeKey;
  }
  return self;
}

- (NSDictionary *)settings {
  NSError *error;

  NSMutableURLRequest *request = [NSMutableURLRequest
      requestWithURL:
          [NSURL URLWithString:[NSString
                                   stringWithFormat:@"https://cdn.segment.com/"
                                                    @"v1/projects/%@/settings",
                                                    _writeKey]]];
  [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
  [request setHTTPMethod:@"GET"];

  NSURLResponse *response = nil;
  NSData *data = [NSURLConnection sendSynchronousRequest:request
                                       returningResponse:&response
                                                   error:&error];
  if (error) {
    return nil;
  }

  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:&error];
  if (error) {
    return nil;
  }

  return json;
}

@end