//
//  SESendOneCardViewController.h
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

typedef void(^SEOneCardFetchCompletion)(NSArray <SEQuestionInCard *> *questionInCards, UIAlertController *alert);
typedef void(^SEEditGameCardViewModelCompletionBlock)(BOOL success, UIAlertController *alert);

@interface SESendOneCardViewModel : NSObject

@property (nonatomic, strong, readonly) SERoom *room;
@property (nonatomic, strong, readonly) SERoomUser *roomUser;
@property (nonatomic, strong, readonly) SEGameCard *card;
@property (nonatomic, strong) NSArray <SEQuestionInCard *> *questionInCards;
@property (nonatomic, strong) SEQuestionInCard *question; 

- (instancetype)initWithRoom:(SERoom *)room roomUser:(SERoomUser *)roomUSer card:(SEGameCard *)card;

- (NSInteger)numberOfQuestions;

- (SEQuestionInCard *)questionInCardForIndexPath:(NSIndexPath *)indexPath;
- (SEQuestionCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (void)fetchOneCardWithCompletionBlock:(SEOneCardFetchCompletion)block;
- (void)updateGameCardWithCompletion:(SEEditGameCardViewModelCompletionBlock)block; 

@end
