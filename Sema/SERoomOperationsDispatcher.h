//
//  SERoomOperationsDispatcher.h
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

#import "SERoomSerializer.h"

typedef void(^SEAddRoomOperationsDispatcherCompletionBlock)(BOOL success, SERoom *room, NSError *error);

@interface SERoomOperationsDispatcher : NSObject

- (void)addRoomWithParams:(SEAddRoomParams *)params completion: (SEAddRoomOperationsDispatcherCompletionBlock)block;

@end
