//
//  SELoginUserParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SELoginUserParams.h"

@implementation SELoginUserParams

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password {
    self = [super init];
    if (self) {
        _email = email;
        _password = password;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"session": @{
                     @"email": _email,
                     @"password": _password
                     }
             };
}

@end
