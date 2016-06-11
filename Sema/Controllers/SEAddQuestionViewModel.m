//
//  SEAddQuestionViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEAddQuestionViewModel.h"

#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

//Operations
#import "SEQuestionOperationsDispatcher.h"


@implementation SEAddQuestionViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _content = @"";
    }
    return self;
}

- (void)addQuestionWithCompletion:(SEAddQuestionViewModelCompletionBlock)block {
    NSError *validationError;
    if (![self validateCredentials:&validationError]) {
        if (block) {
            block(NO, [UIAlertController alertControllerWithError:validationError]);
        }
        
        return;
    }
    
    SENewQuestionParams *params = [[SENewQuestionParams alloc] initWithContent:self.content];
    [[SEQuestionOperationsDispatcher new] addQuestionWithParams:params completion:^(BOOL success, SEQuestion *question, NSError *error) {
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
    return [self.content isValidQuestionContent:error];
}
@end
