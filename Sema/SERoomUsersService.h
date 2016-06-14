//
//  SERoomUsersService.h
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SERoomUser.h"

#import "SERoomParams.h"

//Api
#import "SEApiClient.h"
#import "SERequests.h"

typedef void(^SERoomUserCompletionBlock)(BOOL success, NSArray <SERoomUser *> *roomUsers, NSError *error);

@interface SERoomUsersService : NSObject

- (instancetype)initWithQueue:(NSOperationQueue *)queue;

- (void)fetchRoomUsersWithParams:(SERoomParams *)params completion:(SERoomUserCompletionBlock)block;

@end
