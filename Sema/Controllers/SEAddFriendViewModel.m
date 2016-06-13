//
//  SEAddFriendViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEAddFriendViewModel.h"

#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

//Operations
#import "SEFriendshipOperationsDispatcher.h"

@implementation SEAddFriendViewModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _friendLogin = @"";
    }
    return self;
}

- (void)addFriendWithCompletion:(SEAddFriendViewModelCompletionBlock)block {
    NSError *validationError;
    if (![self validateCredentials:&validationError]) {
        if (block) {
            block(NO, [UIAlertController alertControllerWithError:validationError]);
        }
        
        return;
    }
    
    SEFriendParams *params = [[SEFriendParams alloc] initWithFriendLogin:self.friendLogin];
    [[SEFriendshipOperationsDispatcher new] addFriendshipWithParams:params completion:^(BOOL success, SEFriendship *friendship, NSError *error) {
        if (success && !error) {
        }
        
        if (block) {
            block(success, error ? [UIAlertController alertControllerWithError:error] : nil);
        }
    }];
}

#pragma mark -
#pragma mark - Private

- (BOOL)validateCredentials:(NSError **)error {
    return [self.friendLogin isValidFriendLogin:error];
}

@end
