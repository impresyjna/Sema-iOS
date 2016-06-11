//
//  SEQuestionOperationsDispatcher.m
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEQuestionOperationsDispatcher.h"

@implementation SEQuestionOperationsDispatcher

- (void)addQuestionWithParams:(SENewQuestionParams *)params completion:(SEQuestionOperationsDispatcherCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestAddNewQuestionWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SEQuestionSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"question"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[SEApiClient sharedManager] enqueueOperation:operation];
}
@end
