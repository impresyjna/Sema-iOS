//
//  SEGameCardOperationsDispatcher.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameCardOperationsDispatcher.h"

@implementation SEGameCardOperationsDispatcher

- (void)updateGameCardWithParams:(SEGameCardParams *)params completion:(SEGameCardOperationsDispatcherCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestUpdateGameCardWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SEGameCardSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"game_card"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[SEApiClient sharedManager] enqueueOperation:operation];
    NSLog(@"HTTP curl: %@", [TTTURLRequestFormatter cURLCommandFromURLRequest:operation.request]);
}

@end
