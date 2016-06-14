//
//  SERoomCellViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomCellViewModel.h"

@implementation SERoomCellViewModel

- (instancetype)initWithRoom:(SERoom *)room {
    self = [super init];
    if(self) {
        _roomName = room.name;
        _usersCount = room.usersCount;
        _categoryName = room.categoryName;
    }
    return self;
}
@end
