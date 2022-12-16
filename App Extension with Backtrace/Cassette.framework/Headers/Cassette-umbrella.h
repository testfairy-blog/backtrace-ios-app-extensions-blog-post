#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CASDataSerializer.h"
#import "CASDefaultDataSerializer.h"
#import "CASError.h"
#import "CASFileObjectQueue.h"
#import "CASInMemoryObjectQueue.h"
#import "CASObjectQueue.h"
#import "CASPrivateConstants.h"
#import "CASQueueFile.h"
#import "CASQueueFileElement.h"
#import "Cassette.h"

FOUNDATION_EXPORT double CassetteVersionNumber;
FOUNDATION_EXPORT const unsigned char CassetteVersionString[];

