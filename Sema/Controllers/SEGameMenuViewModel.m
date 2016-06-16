//
//  SEGameMenuViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameMenuViewModel.h"

#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

#import "SERoomUserOperationsDispatcher.h"

@implementation SEGameMenuViewModel

- (instancetype)initWithRoom:(SERoom *)room {
    self = [super init];
    if (self) {
        _room = room;
    }
    return self;
}
- (void)fetchGameCardsWithCompletionBlock:(SEGameCardsViewModelFetchSubjectsCompletion)block {
    SERoomParams *roomParams = [[SERoomParams alloc] initWithRoomId:_room.rId];
    __weak typeof (self) wSelf = self;
    [[SEGameCardsService new] fetchUnreceivedGameCardsWithParams:roomParams completion:^(BOOL success, NSArray<SEGameCard *> *gameCards, NSError *error) {
        if (!success && error && block) {
            block(nil, [UIAlertController alertWithErrorMessage:@"Something went wrong. Please try again."]);
            
            return;
        }
        
        wSelf.gameCards = gameCards;
        if (block) {
            block([wSelf.gameCards copy], nil);
        }
    }];
}

- (void)leaveRoomWithCompletion:(SELeaveRoomViewModelCompletionBlock)block {
    SERoomParams *roomParams = [[SERoomParams alloc] initWithRoomId:_room.rId];
    [[SERoomUserOperationsDispatcher new] leaveRoomWithParams:roomParams completion:^(BOOL success, SERoomUser *user, NSError *error) {
        if (success && !error) {
            
        }
        
        if (block) {
            block(success, error ? [UIAlertController alertControllerWithError:error] : nil);
        }
    }];
    
}
@end
