//
//  SERoomUserCellViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomUserCellViewModel.h"

@implementation SERoomUserCellViewModel

- (instancetype)initWithRoomUser:(SERoomUser *)roomUser {
    self = [super init];
    if(self) {
        _userLogin = roomUser.userLogin;
    }
    return self;
}

@end
