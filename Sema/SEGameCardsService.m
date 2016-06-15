//
//  SEGameCardsService.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameCardsService.h"
#import "SEGameCardsSerializer.h"

@interface SEGameCardsService()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation SEGameCardsService

- (instancetype)initWithQueue:(NSOperationQueue *)queue {
    self = [super init];
    if (self) {
        _queue = queue;
    }
    return self;
}

- (void)fetchGameCardsWithParams:(SERoomParams *)params completion:(SEGameCardCompletionBlock)block {
    
    NSURLRequest *request = [[SEApiClient sharedManager] requestGameCardsIndexWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SEGameCardsSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"game_cards"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    _queue ? [_queue addOperation:operation] : [[SEApiClient sharedManager] enqueueOperation:operation];
}

- (void)fetchUnreceivedGameCardsWithParams:(SERoomParams *)params completion:(SEGameCardCompletionBlock)block {
    
    NSURLRequest *request = [[SEApiClient sharedManager] requestUnreceivedGameCardsIndexWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SEGameCardsSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"game_cards"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    _queue ? [_queue addOperation:operation] : [[SEApiClient sharedManager] enqueueOperation:operation];
}

@end
