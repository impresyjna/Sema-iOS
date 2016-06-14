//
//  SERoomsViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomsViewModel.h"

@interface SERoomsViewModel ()
@property (nonatomic, strong) NSArray <SERoom *> *rooms;
@end

@implementation SERoomsViewModel

- (NSInteger)numberOfRooms {
    return (NSInteger) _rooms.count;
}

- (SERoomCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath {
    SERoom *room = [self roomForIndexPath:indexPath];
    
    return [[SERoomCellViewModel alloc] initWithRoom:room];
}

- (SERoom *)roomForIndexPath:(NSIndexPath *)indexPath {
    return _rooms[(NSUInteger)indexPath.row];
}

- (void)fetchRoomsWithCompletionBlock:(SERoomsViewModelFetchSubjectsCompletion)block {
    __weak typeof (self) wSelf = self;
    [[SERoomsService new] fetchRoomsWithCompletion:^(BOOL success, NSArray<SERoom *> *rooms, NSError *error) {
        if (!success && error && block) {
            block(nil, [UIAlertController alertWithErrorMessage:@"Something went wrong. Please try again."]);
            
            return;
        }
        
        wSelf.rooms = rooms;
        if (block) {
            block([wSelf.rooms copy], nil);
        }
    }];
}
@end
