//
//  SERoomsService.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomsService.h"
#import "SERoomsSerializer.h"

@interface SERoomsService()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation SERoomsService

- (instancetype)initWithQueue:(NSOperationQueue *)queue {
    self = [super init];
    if (self) {
        _queue = queue;
    }
    return self;
}

- (void)fetchRoomsWithCompletion:(SERoomCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestRoomIndex];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SERoomsSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"rooms"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    _queue ? [_queue addOperation:operation] : [[SEApiClient sharedManager] enqueueOperation:operation];
}
@end
