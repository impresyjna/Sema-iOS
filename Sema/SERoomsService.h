//
//  SERoomsService.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "SERoom.h"

//Api
#import "SEApiClient.h"
#import "SERequests.h"

typedef void(^SERoomCompletionBlock)(BOOL success, NSArray <SERoom *> *rooms, NSError *error);

@interface SERoomsService : NSObject

- (instancetype)initWithQueue:(NSOperationQueue *)queue;

- (void)fetchRoomsWithCompletion:(SERoomCompletionBlock)block;

@end
