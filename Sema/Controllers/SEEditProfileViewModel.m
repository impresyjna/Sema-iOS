//
//  SEEditProfileViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEEditProfileViewModel.h"

#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

//Operations
#import "SEUserOperationsDispatcher.h"

//Account
#import "SEAccount.h"

@implementation SEEditProfileViewModel

-(instancetype)init {
    self = [super init];
    if(self) {
        _login = [SEAccount account].user.login;
        _email = [SEAccount account].user.email;
        _password = @"";
        _passwordConfirmation = @"";
    }
    return self;
}

- (void)updateUserWithCompletion:(SEEditUserViewModelCompletionBlock)block {
    NSError *validationError;
    if (![self validateCredentials:&validationError]) {
        if (block) {
            block(NO, [UIAlertController alertControllerWithError:validationError]);
        }
        
        return;
    }
    
    SERegisterUserParams *params = [[SERegisterUserParams alloc] initWithEmail:_email login:_login password:_password passwordConfirmation:_passwordConfirmation];
    
    [[SEUserOperationsDispatcher new] updateUserWithParams:params completion:^(BOOL success, SEUser *user, NSError *error) {
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
    return [self.email isValidEmail:error] && [self.login isValidLogin:error] && (self.password.length + self.passwordConfirmation.length == 0 || ([self.password isValidPassword:error] &&
    [self.passwordConfirmation isValidPasswordConfirmation:self.password error:error]));
}

@end
