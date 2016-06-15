//
//  SEGameMenuViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERoom.h"
#import "SEGameCard.h"

#import "SEGameCardsService.h"

typedef void(^SEGameCardsViewModelFetchSubjectsCompletion)(NSArray <SEGameCard *> *gameCards, UIAlertController *alert);

@interface SEGameMenuViewModel : NSObject

@property (nonatomic, strong) NSArray <SEGameCard *> *gameCards;
@property (nonatomic, strong, readonly) SERoom *room;

- (instancetype)initWithRoom:(SERoom *)room; 
- (void)fetchGameCardsWithCompletionBlock:(SEGameCardsViewModelFetchSubjectsCompletion)block;

@end
