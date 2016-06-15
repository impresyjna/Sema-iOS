//
//  SESendOneCardViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SESendOneCardViewModel.h"

#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"


//Account
#import "SEAccount.h"

@interface SESendOneCardViewModel()
@property (nonatomic, strong) NSArray <SEQuestionInCard *> *questionInCards;
@end

@implementation SESendOneCardViewModel

- (instancetype)initWithRoom:(SERoom *)room roomUser:(SERoomUser *)roomUSer card:(SEGameCard *)card {
    self = [super init];
    if(self) {
        _room = room;
        _roomUser = roomUSer;
        _card = card;
        _questionInCards = card.card.questions;
    }
    return self;
}

- (NSInteger)numberOfQuestions {
    return (NSInteger) _questionInCards.count;
}

- (SEQuestionCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath {
    SEQuestionInCard *questionInCard = [self questionInCardForIndexPath:indexPath];
    
    return [[SEQuestionCellViewModel alloc] initWithQuestionInCard:questionInCard];
}

- (SEQuestionInCard *)questionInCardForIndexPath:(NSIndexPath *)indexPath {
    return _questionInCards[(NSUInteger)indexPath.row];
}

- (void)fetchOneCardWithCompletionBlock:(SEOneCardFetchCompletion)block {
}

@end
