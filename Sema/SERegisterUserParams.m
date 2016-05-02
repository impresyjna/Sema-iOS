//
//  SERegisterUserParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERegisterUserParams.h"

@implementation SERegisterUserParams

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password passwordConfirmation:(NSString *)passwordConfirmation {
    self = [super init];
    if (self) {
        _email = email;
        _password = password;
        _passwordConfirmation = passwordConfirmation;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"user": @{
                     @"email":_email,
                     @"password":_password,
                     @"password_confirmation":_passwordConfirmation
                     }
             };
}

@end
