//
//  SEFriendshipCellViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEFriendshipCellViewModel.h"

@implementation SEFriendshipCellViewModel

- (instancetype)initWithFriendship:(SEFriendship *)friendship {
    self = [super init];
    if (self) {
        _login = friendship.friend.login;
    }
    return self;
};

@end
