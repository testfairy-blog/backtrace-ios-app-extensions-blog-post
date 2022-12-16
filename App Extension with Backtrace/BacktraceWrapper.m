#import "BacktraceWrapper.h"
#if defined(__arm64__) && __arm64__
#import "Backtrace-Swift.h"
#import "Backtrace-PLCrashReporter-umbrella.h"
#endif

@implementation BacktraceWrapper

#pragma mark Globals
#if defined(__arm64__) && __arm64__
static BacktraceClient* client;
#endif

#pragma mark Private

+(void)initializeBacktrace {
#if defined(__arm64__) && __arm64__
    if (client != nil) {
        return;
    }
    
    BacktraceCredentials* credentials = [[BacktraceCredentials alloc] initWithSubmissionUrl: [NSURL URLWithString: @"https://submit.backtrace.io/BACKTRACE_SUBDOMAIN/BACKTRACE_SUBMISSION_TOKEN/plcrash"]];
    
    BacktraceDatabaseSettings *dbSettings = [[BacktraceDatabaseSettings alloc] init];
    dbSettings.maxRecordCount = 10;
      
    BacktraceClientConfiguration *configuration = [[BacktraceClientConfiguration alloc]
                                                initWithCredentials: credentials
                                                dbSettings: dbSettings
                                                reportsPerMin: 30 // Default is 30
                                                allowsAttachingDebugger: FALSE // If false, disables backtrace during development
                                                detectOOM: FALSE];
    
    
    BacktraceCrashReporter* crashReporter = [[BacktraceCrashReporter alloc] initWithConfig: PLCrashReporterConfig.defaultConfiguration];
    client = [[BacktraceClient alloc] initWithConfiguration:configuration crashReporter:crashReporter error:nil];
    
    [client.metrics enableWithSettings:[[BacktraceMetricsSettings alloc] init]];
#endif
}


#pragma mark Public

+(void)sendError:(NSError*)error attributes:(NSDictionary*)extra {
#if defined(__arm64__) && __arm64__
    [self initializeBacktrace];
    [client sendWithError:error attachmentPaths:@[] completion:^(BacktraceResult * _Nonnull result) {
        NSLog(@"Backtrace error sent: %@", [error description]);
    }];
#endif
}

@end
