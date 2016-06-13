//
//  SEFriendshipViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "SEFriendship.h"

//View Model
#import "SEFriendshipCellViewModel.h"

//Service
#import "SEFriendshipsService.h"

//Category
#import "UIAlertController+Errors.h"

typedef void(^SEFriendshipsViewModelFetchSubjectsCompletion)(NSArray <SEFriendship *> *friendships, UIAlertController *alert);
@interface SEFriendshipViewModel : NSObject

- (NSInteger)numberOfFriendships;

- (SEFriendship *)friendshipForIndexPath:(NSIndexPath *)indexPath;
- (SEFriendshipCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (void)fetchFriendshipsWithCompletionBlock:(SEFriendshipsViewModelFetchSubjectsCompletion)block;

@end
