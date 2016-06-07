//
//  SERegisterViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 06.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERegisterViewModel.h"

#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

//Operations
#import "SESessionOperationsDispatcher.h"

//Account
#import "SEAccount.h"

@implementation SERegisterViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _email = @"";
        _login = @"";
        _password = @"";
        _passwordConfirmation = @"";
    }
    return self;
}

-(void)registerWithCompletion:(SERegisterCompletionBlock)block{
    
    NSError *validationError;
    if (![self validateCredentials:&validationError]) {
        if (block) {
            block(NO, [UIAlertController alertControllerWithError:validationError]);
        }
        
        return;
    }
    
    SERegisterUserParams *params = [[SERegisterUserParams alloc] initWithEmail:_email login:_login password:_password passwordConfirmation:_passwordConfirmation];
    
    [[SESessionOperationsDispatcher new] registerUserWithParams:params completion:^(BOOL success, SEUser *user, NSError *error) {
        if (success && !error) {
            [[SEAccount account] registerAccountWithAuthenticationToken:user.authToken expirationDate:nil accountType:AUAccountTypeCustom error:nil];
            
            [[SEAccount account] updateUser:user];
        }
        
        if (block) {
            block(success, error ? [UIAlertController alertControllerWithError:error] : nil);
        }
    }];
}

#pragma mark -
#pragma mark - Private

- (BOOL)validateCredentials:(NSError *__autoreleasing *)error {
    return [self.email isValidEmail:error] &&
    [self.password isValidPassword:error] &&
    [self.passwordConfirmation isValidPasswordConfirmation:self.password error:error];
}

@end
