//
//  SERoomUsersService.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomUsersService.h"
#import "SERoomUsersSerializer.h"

@interface SERoomUsersService()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation SERoomUsersService

- (instancetype)initWithQueue:(NSOperationQueue *)queue {
    self = [super init];
    if (self) {
        _queue = queue;
    }
    return self;
}

-(void)fetchRoomUsersWithParams:(SERoomParams *)params completion:(SERoomUserCompletionBlock)block {
    NSURLRequest *request = [[SEApiClient sharedManager] requestRoomUsersIndexWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [SERoomUsersSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"room_users"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    _queue ? [_queue addOperation:operation] : [[SEApiClient sharedManager] enqueueOperation:operation];
}
@end
