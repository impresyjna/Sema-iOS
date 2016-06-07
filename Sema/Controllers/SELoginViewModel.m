//
//  SELoginViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 07.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SELoginViewModel.h"

#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

//Operations
#import "SESessionOperationsDispatcher.h"

//Account
#import "SEAccount.h"

@implementation SELoginViewModel


- (instancetype)init {
    self = [super init];
    if (self) {
        _password = @"";
        _login = @"";
    }
    return self;
}

-(void)loginWithCompletion:(SELoginViewModelCompletionBlock)block {
    NSError *validationError;
    if (![self validateCredentials:&validationError]) {
        if (block) {
            block(NO, [UIAlertController alertControllerWithError:validationError]);
        }
        
        return;
    }
    
    SELoginUserParams *params = [[SELoginUserParams alloc] initWithLogin:self.login password:self.password];
    [[SESessionOperationsDispatcher new] loginUserWithParams:params completion:^(BOOL success, SEUser *user, NSError *error) {
        if (success && !error) {
            
            //Register account
            [[SEAccount account] registerAccountWithAuthenticationToken:user.authToken
                                                         expirationDate:nil
                                                            accountType:AUAccountTypeCustom
                                                                  error:nil];
            //Update user
            [[SEAccount account] updateUser:user];
            
        }
        
        if (block) {
            block(success, error ? [UIAlertController alertControllerWithError:error] : nil);
        }
    }];
    
}

#pragma mark -
#pragma mark - Private

- (BOOL)validateCredentials:(NSError **)error {
    return [self.login isValidLogin:error] && [self.password isValidPassword:error];
}

@end
