//
//  SEGameCardsService.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "SEGameCard.h"

#import "SERoomParams.h"
//Api
#import "SEApiClient.h"
#import "SERequests.h"

typedef void(^SEGameCardCompletionBlock)(BOOL success, NSArray <SEGameCard *> *gameCards, NSError *error);

@interface SEGameCardsService : NSObject

- (instancetype)initWithQueue:(NSOperationQueue *)queue;

- (void)fetchGameCardsWithParams:(SERoomParams *)params completion:(SEGameCardCompletionBlock)block;
- (void)fetchUnreceivedGameCardsWithParams:(SERoomParams *)params completion:(SEGameCardCompletionBlock)block; 
@end
