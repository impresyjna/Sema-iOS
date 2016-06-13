//
//  SEFriendshipViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEFriendshipViewModel.h"

@interface SEFriendshipViewModel ()
@property (nonatomic, strong) NSArray <SEFriendship *> *friendships;
@end

@implementation SEFriendshipViewModel

- (NSInteger)numberOfFriendships {
    return (NSInteger)_friendships.count;
}

- (SEFriendshipCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath {
    SEFriendship *friendship = [self friendshipForIndexPath:indexPath];
    
    return [[SEFriendshipCellViewModel alloc] initWithFriendship:friendship];
}

- (SEFriendship *)friendshipForIndexPath:(NSIndexPath *)indexPath{
    return _friendships[(NSUInteger)indexPath.row];
}

- (void)fetchFriendshipsWithCompletionBlock:(SEFriendshipsViewModelFetchSubjectsCompletion)block {
    __weak typeof (self) wSelf = self;
    [[SEFriendshipsService new] fetchFriendshipWithCompletion:^(BOOL success, NSArray<SEFriendship *> *friendships, NSError *error) {
        if (!success && error && block) {
            block(nil, [UIAlertController alertWithErrorMessage:@"Something went wrong. Please try again."]);
            
            return;
        }
        
        wSelf.friendships = friendships;
        if (block) {
            block([wSelf.friendships copy], nil);
        }
    }];
}

@end
