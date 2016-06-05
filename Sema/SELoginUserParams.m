//
//  SELoginUserParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SELoginUserParams.h"

@implementation SELoginUserParams

- (instancetype)initWithLogin:(NSString *)login password:(NSString *)password {
    self = [super init];
    if (self) {
        _login = login;
        _password = password;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"session": @{
                     @"login": _login,
                     @"password": _password
                     }
             };
}

@end
