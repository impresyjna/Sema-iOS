//
//  SEAddRoomViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEAddRoomViewModel.h"


#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

//Operations
#import "SERoomOperationsDispatcher.h"

@implementation SEAddRoomViewModel

- (instancetype)init {
    self = [super init];
    if(self) {
        _name = @"";
    }
    return self;
}

- (void)addNewRoomWithCompletion:(SEAddRoomViewModelCompletionBlock)block{
    NSError *validationError;
    if (![self validateCredentials:&validationError]) {
        if (block) {
            block(NO, [UIAlertController alertControllerWithError:validationError]);
        }
        
        return;
    }
    
    SEAddRoomParams *params = [[SEAddRoomParams alloc] initWithName:self.name];
    [[SERoomOperationsDispatcher new] addRoomWithParams:params completion:^(BOOL success, SERoom *room, NSError *error) {
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
    return [self.name isValidQuestionContent:error];
}

@end
