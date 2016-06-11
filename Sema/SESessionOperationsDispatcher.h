//
//  SESessionOperationsDispatcher.h
//  Sema
//
//  Created by Joanna Furmaniak on 06.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Client
#import "SEApiClient.h"

//Requests
#import "SERequests.h"

//Serializers
#import "SEUserSerializer.h"


typedef void(^SESessionOperationsDispatcherCompletionBlock)(BOOL success, SEUser *user, NSError *error);

@interface SESessionOperationsDispatcher : NSObject

- (void)loginUserWithParams:(SELoginUserParams *)params completion:(SESessionOperationsDispatcherCompletionBlock)block;

- (void)registerUserWithParams:(SERegisterUserParams *)params completion:(SESessionOperationsDispatcherCompletionBlock)block;

- (void)logoutUserWithCompletion:(SESessionOperationsDispatcherCompletionBlock)block;

@end
