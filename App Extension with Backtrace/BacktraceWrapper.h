#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BacktraceWrapper : NSObject

+(void)sendError:(NSError*)error attributes:(NSDictionary*)extra;

@end

NS_ASSUME_NONNULL_END
