//
//  SEApiClient.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEApiClient.h"

//Environment
#import "SEEnvironment.h"

#import "SEAccount.h"

@implementation SEApiClient

+ (instancetype)sharedManager {
    static SEApiClient *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *apiUrl = [[SEEnvironment sharedConfiguration] apiBaseURL]; 
        sharedManager = [[self alloc] initWithBaseURL:apiUrl];
    });
    return sharedManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        AFJSONRequestSerializer *jsonSerializer = [AFJSONRequestSerializer serializer];
        
        [jsonSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [jsonSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        [self setRequestSerializer:jsonSerializer];
        
        // update `X-AUTH-TOKEN` block
        void (^authTokenBlock)(void) = ^{
            // get auth token
            NSString *token = [[SEAccount account] authenticationToken:nil];
            
            // add HTTP header
            [jsonSerializer setValue:token forHTTPHeaderField:@"Authorization"];
        };
        
        if ([[SEAccount account] isLoggedIn]) {
            // update `X-AUTH-TOKEN`
            authTokenBlock();
        }
        
        // we should invalidate that value on every login
        [[NSNotificationCenter defaultCenter] addObserverForName:AUAccountDidLoginUserNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
            // update `X-AUTH-TOKEN`
            authTokenBlock();
        }];
        
        // handle error globally
        [[NSNotificationCenter defaultCenter] addObserverForName:AFNetworkingOperationDidFinishNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
            AFHTTPRequestOperation *operation = (AFHTTPRequestOperation *)[note object];
            
            // get response status code
            NSUInteger statusCode = (NSUInteger)[operation.response statusCode];
            
            // send error to Crashlytics if needed
            if (![operation.responseSerializer.acceptableStatusCodes containsIndex:statusCode] && statusCode > 99) {
                NSLog(@"HTTP Error: %lu, curl: %@", (long)[operation.response statusCode], [TTTURLRequestFormatter cURLCommandFromURLRequest:operation.request]);
            }
        }];
        
    }
    return self;
}

- (void)enqueueOperation:(NSOperation *)operation {
    [[NSOperationQueue mainQueue] addOperation:operation]; 
}

@end
