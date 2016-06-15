//
//  SERoomUserOperationsDispatcher.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
//Client
#import "SEApiClient.h"

//Requests
#import "SERequests.h"

#import "SERoomUserSerializer.h"

typedef void(^SERoomUserOperationsDispatcherCompletionBlock)(BOOL success, SERoomUser *roomUser, NSError *error);

@interface SERoomUserOperationsDispatcher : NSObject

- (void)joinRoomWithParams:(SERoomParams *)params completion: (SERoomUserOperationsDispatcherCompletionBlock)block;

@end
