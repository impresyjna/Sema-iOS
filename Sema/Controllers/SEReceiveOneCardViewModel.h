//
//  SEReceiveOneCardViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "SERoomUser.h"
#import "SERoom.h"
#import "SEQuestionInCard.h"
#import "SEGameCard.h"

//View Model
#import "SEQuestionCellViewModel.h"

//Category
#import "UIAlertController+Errors.h"

typedef void(^SEReceiveOneCardFetchCompletion)(NSArray <SEQuestionInCard *> *questionInCards, UIAlertController *alert);

@interface SEReceiveOneCardViewModel : NSObject

@property (nonatomic, strong, readonly) SERoom *room;
@property (nonatomic, strong, readonly) SEGameCard *card;

- (instancetype)initWithRoom:(SERoom *)room card:(SEGameCard *)card;

- (NSInteger)numberOfQuestions;

- (SEQuestionInCard *)questionInCardForIndexPath:(NSIndexPath *)indexPath;
- (SEQuestionCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (void)fetchOneCardWithCompletionBlock:(SEReceiveOneCardFetchCompletion)block;

@end
