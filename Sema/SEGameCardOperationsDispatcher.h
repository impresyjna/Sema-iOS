//
//  SEGameCardOperationsDispatcher.h
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

#import "SEGameCardSerializer.h"

typedef void(^SEGameCardOperationsDispatcherCompletionBlock)(BOOL success, SEGameCard *gameCard, NSError *error);

@interface SEGameCardOperationsDispatcher : NSObject

- (void)updateGameCardWithParams:(SEGameCardParams *)params completion: (SEGameCardOperationsDispatcherCompletionBlock)block;

@end
