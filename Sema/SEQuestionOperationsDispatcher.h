//
//  SEQuestionOperationsDispatcher.h
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Client
#import "SEApiClient.h"

//Requests
#import "SERequests.h"

#import "SEQuestionSerializer.h"

typedef void(^SEQuestionOperationsDispatcherCompletionBlock)(BOOL success, SEQuestion *question, NSError *error);

@interface SEQuestionOperationsDispatcher : NSObject

- (void)addQuestionWithParams:(SENewQuestionParams *)params completion: (SEQuestionOperationsDispatcherCompletionBlock)block;

@end
