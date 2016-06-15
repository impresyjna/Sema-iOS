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
@end
