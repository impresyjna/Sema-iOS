//
//  SEFriendParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEFriendParams.h"

@implementation SEFriendParams

- (instancetype)initWithFriendLogin:(NSString *)friendLogin {
    self = [super init];
    
    if(self) {
        _friendLogin = friendLogin;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"friend": @{
                     @"login": _friendLogin
                     }
             };
}

@end
