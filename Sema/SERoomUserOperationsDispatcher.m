//
//  SERoomUserOperationsDispatcher.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomUserOperationsDispatcher.h"

@implementation SERoomUserOperationsDispatcher

- (void)joinRoomWithParams:(SERoomParams *)params completion:(SERoomUserOperationsDispatcherCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestJoinRoomWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SERoomUserSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"room_user"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[SEApiClient sharedManager] enqueueOperation:operation];
}

@end
