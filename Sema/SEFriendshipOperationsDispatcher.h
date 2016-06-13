//
//  SEFriendshipOperationsDispatcher.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Client
#import "SEApiClient.h"

//Requests
#import "SERequests.h"

#import "SEFriendshipsSerializer.h"

typedef void(^SEFriendshipOperationsDispatcherCompletionBlock)(BOOL success, SEFriendship *friendship, NSError *error);

@interface SEFriendshipOperationsDispatcher : NSObject

- (void)addFriendshipWithParams:(SEFriendParams *)params completion: (SEFriendshipOperationsDispatcherCompletionBlock)block;

@end
