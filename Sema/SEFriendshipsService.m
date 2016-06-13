//
//  SEActionSubjectsService.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//
#import "SEFriendshipsService.h"
#import "SEFriendshipsSerializer.h"

@interface SEFriendshipsService()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation SEFriendshipsService

- (instancetype)initWithQueue:(NSOperationQueue *)queue {
    self = [super init];
    if (self) {
        _queue = queue;
    }
    return self;
}

- (void)fetchFriendshipWithCompletion:(SEFriendshipCompletionBlock)block {
    
    NSURLRequest *request = [[SEApiClient sharedManager] requestFriendshipIndex];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SEFriendshipsSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"friendships"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    _queue ? [_queue addOperation:operation] : [[SEApiClient sharedManager] enqueueOperation:operation];
}

@end
