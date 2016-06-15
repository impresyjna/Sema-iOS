//
//  SESettingsViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SESettingsViewModel.h"

#import "UIAlertController+Errors.h"

//Operations
#import "SESessionOperationsDispatcher.h"

//Account
#import "SEAccount.h"

@implementation SESettingsViewModel

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)logoutWithCompletion:(SESettingsViewModelCompletionBlock)block {
    
    [[SESessionOperationsDispatcher new] logoutUserWithCompletion:^(BOOL success, SEUser *user, NSError *error) {
        if (success && !error) {
            
        }
        
        if (block) {
            block(success, error ? [UIAlertController alertControllerWithError:error] : nil);
        }
    }];
    
    //Update user
    [[SEAccount account] updateUser:nil];
}

@end
