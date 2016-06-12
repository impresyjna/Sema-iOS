//
//  SERegisterUserParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERegisterUserParams.h"

@implementation SERegisterUserParams

- (instancetype)initWithEmail:(NSString *)email login:(NSString *)login password:(NSString *)password passwordConfirmation:(NSString *)passwordConfirmation {
    self = [super init];
    if (self) {
        _email = email;
        _login = login;
        _password = password;
        _passwordConfirmation = passwordConfirmation;
    }
    return self;
}
- (NSDictionary *)params {
    NSMutableDictionary *userParams = [NSMutableDictionary new];
    [userParams setObject:_email forKey:@"email"];
    [userParams setObject:_login forKey:@"login"];
    if(_password.length>0) {
        [userParams setObject:_password forKey:@"password"];
        [userParams setObject:_passwordConfirmation forKey:@"password_confirmation"];
    }
    return @{
             @"user": userParams
             };
}

@end
