//
//  SESessionOperationsDispatcher.m
//  Sema
//
//  Created by Joanna Furmaniak on 06.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SESessionOperationsDispatcher.h"

@implementation SESessionOperationsDispatcher

- (void)loginUserWithParams:(SELoginUserParams *)params completion:(SESessionOperationsDispatcherCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestLoginUserWithParams:params];
    
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

-(void)registerUserWithParams:(SERegisterUserParams *)params completion:(SESessionOperationsDispatcherCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestRegisterUserWithParams:params];
    
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

- (void)logoutUserWithCompletion:(SESessionOperationsDispatcherCompletionBlock)block {
    /* NSURLRequest *request = [[SEApiClient sharedManager] requestLogoutCurrentUser];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, nil, nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[SEApiClient sharedManager] enqueueOperation:operation]; */
}

@end
