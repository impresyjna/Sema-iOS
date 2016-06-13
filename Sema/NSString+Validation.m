//
//  NSString+Validation.m
//  Sema
//
//  Created by Joanna Furmaniak on 07.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)isValidEmail:(NSError *__autoreleasing *)error {
    NSString *emailRegexp = @"^.+@.+\\..{2,}$";
    BOOL emailValid = [self rangeOfString:emailRegexp options:NSRegularExpressionSearch].location != NSNotFound;
    
    if (!emailValid && error) {
        *error = [self errorWithMessage:@"Email is invalid"];
    }
    
    return emailValid;
}

- (BOOL)isValidLogin:(NSError *__autoreleasing *)error {
    BOOL lengthValid = self.length >= 1;
    if (!lengthValid && error) {
        *error = [self errorWithMessage:@"Login is too short"];
    }
    
    BOOL charactersValid = [self rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]].location == NSNotFound;
    if (!charactersValid && error) {
        *error = [self errorWithMessage:@"Login contains illegal characters"];
    }
    
    return lengthValid && charactersValid;
}

- (BOOL)isValidPassword:(NSError *__autoreleasing *)error {
    BOOL lengthValid = self.length >= 8;
    if (!lengthValid && error) {
        *error = [self errorWithMessage:@"Password should have at least 8 characters"];
    }
    
    BOOL charactersValid = [self rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]].location == NSNotFound;
    if (!charactersValid && error) {
        *error = [self errorWithMessage:@"Password contains illegal characters"];
    }
    
    return lengthValid && charactersValid;
}

- (BOOL)isValidPasswordConfirmation:(NSString *)password error:(NSError *__autoreleasing *)error {
    BOOL validConfirmation = [self isEqualToString:password];
    
    if (!validConfirmation && error) {
        *error = [self errorWithMessage:@"Passwords do not match"];
    }
    
    return validConfirmation;
}

-(BOOL)isValidQuestionContent:(NSError *__autoreleasing *)error {
    BOOL lengthValid = self.length > 0;
    if (!lengthValid && error) {
        *error = [self errorWithMessage:@"It has to be content of the question"];
    }
    return lengthValid;
}

- (BOOL)isValidFriendLogin:(NSError *__autoreleasing *)error {
    BOOL lengthValid = self.length > 0;
    if (!lengthValid && error) {
        *error = [self errorWithMessage:@"It has to be friend login"];
    }
     return lengthValid;
}

#pragma mark -
#pragma mark - Private

- (NSError *)errorWithMessage:(NSString *)message {
    return [NSError errorWithDomain:kSEErrorDomain code:500
                           userInfo:@{ @"message": message }];
    
}

@end
