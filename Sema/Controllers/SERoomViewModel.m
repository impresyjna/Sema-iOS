//
//  SERoomViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomViewModel.h"

@interface SERoomViewModel ()
@property (nonatomic, strong) NSArray <SERoomUser *> *roomUsers;
@end

@implementation SERoomViewModel

- (instancetype)initWithRoom:(SERoom *)room {
    self = [super init];
    if (self) {
        _room = room;
    }
    return self;
}

- (NSInteger)numberOfRoomUsers {
    return (NSInteger) _roomUsers.count;
}

- (SERoomUserCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath {
    SERoomUser *roomUser = [self roomUserForIndexPath:indexPath];
    
    return [[SERoomUserCellViewModel alloc] initWithRoomUser:roomUser];
}

- (SERoomUser *)roomUserForIndexPath:(NSIndexPath *)indexPath {
    return _roomUsers[(NSUInteger)indexPath.row];
}

- (void)fetchRoomUsersWithCompletionBlock:(SERoomUsersViewModelFetchSubjectsCompletion)block {
    SERoomParams *roomParams = [[SERoomParams alloc] initWithRoomId:_room.rId];
    __weak typeof (self) wSelf = self;
    [[SERoomUsersService new] fetchRoomUsersWithParams:roomParams completion:^(BOOL success, NSArray<SERoomUser *> *roomUsers, NSError *error) {
        if (!success && error && block) {
            block(nil, [UIAlertController alertWithErrorMessage:@"Something went wrong. Please try again."]);
            
            return;
        }
        
        wSelf.roomUsers = roomUsers;
        if (block) {
            block([wSelf.roomUsers copy], nil);
        }
    }];
}
@end
