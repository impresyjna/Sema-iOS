//
//  SEChooseWhoToSendViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "SERoomUser.h"
#import "SERoom.h"
#import "SEGameCard.h"

//View Model
#import "SERoomUserCellViewModel.h"

//Service
#import "SERoomUsersService.h"
#import "SEGameCardsService.h"

//Category
#import "UIAlertController+Errors.h"

typedef void(^SERoomUsersViewModelFetchSubjectsCompletion)(NSArray <SERoomUser *> *gameUsers, UIAlertController *alert);
typedef void(^SEGameCardsViewModelFetchSubjectsCompletion)(NSArray <SEGameCard *> *gameCards, UIAlertController *alert);

@interface SEChooseWhoToSendViewModel : NSObject

@property (nonatomic, strong) NSArray <SEGameCard *> *gameCards;
@property (nonatomic, strong, readonly) SERoom *room;

- (instancetype)initWithRoom:(SERoom *)room;

- (NSInteger)numberOfRoomUsers;

- (SERoomUser *)roomUserForIndexPath:(NSIndexPath *)indexPath;
- (SERoomUserCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (void)fetchRoomUsersWithCompletionBlock:(SERoomUsersViewModelFetchSubjectsCompletion)block;
- (void)fetchGameCardsWithCompletionBlock:(SEGameCardsViewModelFetchSubjectsCompletion)block;

@end
