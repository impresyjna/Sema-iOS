//
//  SEUserOperationsDispatcher.h
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Client
#import "SEApiClient.h"

//Requests
#import "SERequests.h"

#import "SEUserSerializer.h"

typedef void(^SEUserOperationsDispatcherCompletionBlock)(BOOL success, SEUser *user, NSError *error);

@interface SEUserOperationsDispatcher : NSObject

- (void)updateUserWithParams:(SERegisterUserParams *)params completion: (SEUserOperationsDispatcherCompletionBlock)block;

@end
