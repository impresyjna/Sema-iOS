//
//  SEGameMenuViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameMenuViewModel.h"

@implementation SEGameMenuViewModel

- (instancetype)initWithRoom:(SERoom *)room {
    self = [super init];
    if (self) {
        _room = room;
    }
    return self;
}

@end
