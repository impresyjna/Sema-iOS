//
//  SEUserOperationsDispatcher.m
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEUserOperationsDispatcher.h"

@implementation SEUserOperationsDispatcher

- (void)updateUserWithParams:(SERegisterUserParams *)params completion:(SEUserOperationsDispatcherCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestUpdateUserWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SEUserSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"user"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[SEApiClient sharedManager] enqueueOperation:operation];
}

@end
