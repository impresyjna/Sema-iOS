//
//  SERoomOperationsDispatcher.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomOperationsDispatcher.h"

@implementation SERoomOperationsDispatcher

- (void)addRoomWithParams:(SEAddRoomParams *)params completion:(SEAddRoomOperationsDispatcherCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestAddNewRoomWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SERoomSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"room"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[SEApiClient sharedManager] enqueueOperation:operation];
}

@end
