//
//  SEActionSubjectsService.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "SEFriendship.h"

//Api
#import "SEApiClient.h"
#import "SERequests.h"

typedef void(^SEFriendshipCompletionBlock)(BOOL success, NSArray <SEFriendship *> *friendships, NSError *error);

@interface SEFriendshipsService : NSObject

- (instancetype)initWithQueue:(NSOperationQueue *)queue;

- (void)fetchFriendshipWithCompletion:(SEFriendshipCompletionBlock)block;

@end
