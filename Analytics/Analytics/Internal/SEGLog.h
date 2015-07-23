#import <Foundation/Foundation.h>

#ifndef SEGLog_h
#define SEGLog_h

static inline void SEGLogReal(NSString *format, ...) {
  __block va_list arg_list;
  va_start(arg_list, format);
  NSString *formattedString =
      [[NSString alloc] initWithFormat:format arguments:arg_list];
  va_end(arg_list);
  NSLog(@"[Segment] %@", formattedString);
}

#if defined(SEGMENT_DEBUG) || defined(DEBUG)
#define SEGLog(...) SEGLogReal(__VA_ARGS__)
#else
#define SEGLog(...)
#endif

#endif